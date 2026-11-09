# setup-template.R
#
# Fills the iteration-specific values that Quarto's {{< var >}} shortcode
# cannot reach: _quarto.yml (site-url, repo-url, sidebar GitHub href,
# Plausible analytics) and the slide deck front matter (author affiliation).
# Reads _variables.yml as the single source of truth. Idempotent: re-running
# after editing _variables.yml re-derives cleanly and reports "no changes".
#
# Usage: Rscript setup-template.R   (run from the repo root)
#
# See TEMPLATING.md for the full playbook.

suppressPackageStartupMessages({
  library(yaml)
})

vars <- yaml::read_yaml("_variables.yml")

# ---- helpers ---------------------------------------------------------------

# Write `content` to `path` only if it differs; report what happened.
write_if_changed <- function(path, content) {
  old <- if (file.exists(path)) paste(readLines(path, warn = FALSE), collapse = "\n") else ""
  new <- paste(content, collapse = "\n")
  if (identical(old, new)) {
    message("  no changes: ", path)
    invisible(FALSE)
  } else {
    writeLines(content, path)
    message("  updated:    ", path)
    invisible(TRUE)
  }
}

gh   <- vars$github
site <- gh$`site-url`
repo <- gh$`repo-url`
plausible <- gh$`plausible-domain`

# ---- 1. patch _quarto.yml --------------------------------------------------

qy <- readLines("_quarto.yml", warn = FALSE)

# site-url: line under website:
qy <- sub('^(\\s*site-url:\\s*").*(".*)$', paste0("\\1", site, "\\2"), qy)
# repo-url: line (no quotes in the template)
qy <- sub('^(\\s*repo-url:\\s*).*$', paste0("\\1", repo), qy)
# sidebar GitHub tool href (the https://.../website line under tools:)
qy <- sub('^(\\s*href:\\s*)https://github\\.com/[^/]+/website(\\s*)$',
          paste0("\\1", repo, "\\2"), qy)

# Plausible: set data-domain, or drop the whole include-in-header block if empty.
if (is.null(plausible) || !nzchar(plausible)) {
  # remove the two-line include-in-header analytics block if present
  drop <- grep("plausible.io/js/script.js", qy)
  if (length(drop)) {
    # remove the script line and the 3 scaffolding lines above it
    # (include-in-header:, the comment, and the "- text: |" line)
    start <- max(grep("include-in-header:", qy))
    qy <- qy[-(start:drop)]
  }
} else {
  qy <- sub('(data-domain=").*?(")', paste0("\\1", plausible, "\\2"), qy)
}

write_if_changed("_quarto.yml", qy)

# ---- 2. patch slide deck front matter --------------------------------------

slides <- "workshop/slides.qmd"
if (file.exists(slides)) {
  sl  <- readLines(slides, warn = FALSE)
  aff <- paste0(vars$department, " - ", vars$institute)
  # Replace the author affiliation "- name:" line in the front matter.
  idx <- grep("^\\s*- name: .* - ETH Zurich\\s*$", sl)
  if (length(idx)) sl[idx] <- sub("(- name: ).*", paste0("\\1", aff), sl[idx])
  write_if_changed(slides, sl)
}

message("Done. Review the diff, then render with quarto render.")
