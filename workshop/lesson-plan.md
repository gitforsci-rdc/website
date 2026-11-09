# Lesson plan (run of show)

> Template note: this is the worked lesson plan from the reference `gitforsci-ghe`
> cohort (Summer 2026), kept as an example. Adapt the dates, location, and
> per-block times to your own iteration; it is not rendered into the site.

Wednesday 15 July 2026, 09:30-14:30, ETH Zurich. Built from the current 8-Part
deck (`workshop/slides.qmd`) and the schedule CSV. Per-block times get updated
after the dry-run (same file, new commit, no amend).

The focus of this plan is the **My turn** blocks: exactly what I do at the
keyboard while the room watches. My-turn slides say only "sit back and watch";
the steps below are the demo script, not shown on screen.

## Operating rules

- My turn = instructor drives, room watches and notes questions. Your turn =
  learners drive, sticky note when done (Zoom: "done" in chat). Our turn = whole
  room does the same small step together.
- Two location icons on every Your-turn slide: laptop-code = RStudio on your
  machine; GitHub mark = github.com in the browser.
- Say the two anchor lines early: "not an AI workshop today, that is the
  follow-up" and "it is safe to fail here, everything is reversible".
- Bounded regroup after each Your turn: 2 min, then park-and-pair, 1:1 fix at the
  next break. Never let one stuck learner stop the room.
- Protected blocks: Part 6 (pull request) and Part 8 (concept map revisit). If
  behind, cut from Part 7 (merge conflict) first.

---

## Arrival (09:30-10:00, 30 min)

- Room: whiteboard/flipchart visible from all seats, chunky dark markers, A3
  paper (2 sheets per learner), thin pens, yellow sticky notes on every seat.
- Setup check as learners arrive: RStudio opens, GitHub login works, PAT set.
  Anyone with a broken setup gets the helper, not me.
- If the dry-run showed under 70 percent verified pushes: this slot becomes a
  setup clinic instead.

---

## Part 1: Welcome, concept-map intro, baseline map (10:00-10:30, 30 min)

Slides: Meet the lecturer -> Your turn (reflection) -> What this day is/is not ->
toolbox -> Meeting you where you are (survey plots) -> How you store data ->
What you want to learn -> Meet Arti -> Course structure -> Course icons ->
Learning objectives -> Schedule -> Concept maps intro.

### Slides + framing (12 min)

- Meet the lecturer (1 min).
- Your turn reflection (2 min, countdown 2): "the last time you published a
  written document, which tasks gave you joy, which were frustrating?" Notes
  only, no share-out.
- What this day is and is not. **Say in minute 5**: "Today is not an AI
  workshop. Working with AI coding agents builds on exactly these skills; that is
  the follow-up workshop." And: "It is safe to fail here. Everything we do today
  is reversible, and breaking things is part of the plan."
- Survey plots (Meeting you where you are, How you store your data, What you want
  to learn): read the room's own data back to them, tie the three want-to-learn
  buckets to Arti / Bianca / Cem.
- Meet Arti: name the focus learner. I teach to Arti.
- Objectives (three, keyword-led): Commit cycle, Collaboration, Concept map.
- Schedule: point at the eight Parts.

### Concept-map intro (8 min)

- Exemplar tea map on the slide. Read one arrow out loud as a sentence: "the
  kettle HEATS the water."
- Name what it is not: not a flowchart, not a timeline, not a list. No start, no
  end.

### Your turn: baseline map (10 min, countdown 8)

- One prompt: "How does a document you write reach your co-author and come back?
  Draw it as a concept map." Things as nodes, arrows with verb labels.
- Expected content: email attachments, Dropbox, Google Docs, file naming
  (final_v2). Do not correct anything.
- Learners **pin the baseline map on the wall**; it returns in Part 8.

---

## Part 2: Create and clone (10:30-10:50, 20 min)

Slides: Arti's project (before/after) -> My turn -> Your turn -> take-down prompt
-> Local and remote (drawing 1) -> clarify.

### My turn (10 min) [DEMO SCRIPT]

Repo: my own `website`. Screen shared, projector on for the clicks.

1. On github.com: create a repo `website`, public, **with a README** so the
   clone is never empty. (2)
2. RStudio settings, set once: Tools > Global Options > General, "Save workspace
   to .RData on exit: Never"; Tools > Global Options > Code, check "use native
   pipe operator" `|>`. (2)
3. Clone: File > New Project > Version Control > Git, paste the HTTPS URL, create
   inside the pre-work folder `~/Documents/gitrepos/gh-USERNAME`. (3)
4. Inspect the local repo: Files tab, Git tab. Point at `.gitignore` and
   `website.Rproj` with their yellow `?` icons. (3)
   - **Answer the carried-over learner question out loud** ("why do .Rproj
     session files show up?"): `.Rproj` holds RStudio project settings;
     `.gitignore` lists what Git should not track; the yellow `?` means Git sees
     the files but has no instruction for them yet. Dot-files are hidden by the
     operating system.

### Your turn (8 min, countdown 10 on slide; shorten to fit) 

- Learners create their own `website` repo (public, with README), set the two
  RStudio options, clone into `gitrepos/gh-USERNAME`. Sticky note when the two
  yellow `?` icons are visible.
- Regroup (2). Take-down-sticky prompt slide, then the "Local and remote" drawing
  (build-up: local, remote, clone, push/pull) as the summary.

Note: the "Our turn" GitHub-edit-and-commit step now lives at the end of Part 3,
not here (we have not committed yet at this point).

---

## Break (10:50-11:00, 10 min)

1:1 fixes for parked learners; helper takes the list.

---

## Part 3: The commit cycle (11:00-11:30, 30 min)

Slides: A button is a command -> Arti's commit (before/after) -> My turn ->
Your turn -> Our turn -> The commit cycle (drawing 2) -> clarify.

### Opening framing (2 min)

- "A button is a command": RStudio is a GUI. Clicking **Pull** runs `git pull`.
  Every button today is a Git command underneath; clicking it is not a lesser
  path. Return to this whenever someone worries they are "not really doing Git".

### My turn (13 min) [DEMO SCRIPT]

Repo: my `website`.

1. Edit README, save, point out the **blue M** next to the file in the Git tab.
   (2)
2. The mantra, in order, said out loud each time: **Pull, Stage, Commit, Push**.
   Pull (nothing to get yet, but build the habit), Stage (checkbox), Commit
   (message that says what changed), Push. (4)
3. On GitHub: open the repo, show the commit message and the file change there.
   Show the history / commit list. (2)
4. **Revert demo, instructor only** (3): make a deliberately bad commit (delete
   half the README), commit it, then revert it via the history. Show that the
   history keeps both the mistake and the undo. **Say out loud**: "Almost
   everything in Git is reversible." (Answers the carried-over question "how do I
   take a commit back?") Note: the GUI revert is `git revert`.
5. **Credentials moment** (2): hands up, who was asked for a username and
   password? Walk `gitcreds::gitcreds_set()` in the console with the PAT from
   pre-work step 4. Fix credentials for everyone now; the afternoon depends on
   pushing.

### Your turn (10 min, countdown 10)

- Full PSCP cycle on their own README (Pull first), verify the commit on GitHub.
  Target: every learner has 2 pushed commits.

### Our turn (5 min)

- Start on github.com this time: edit README and commit with the pencil; add a
  file in a new folder (`data/notes.md`). Then in RStudio, **Pull** to bring both
  commits down. Closes the loop: a commit can start on GitHub, and Pull is how it
  reaches the laptop.
- The commit cycle drawing (build-up: working files, stage, commit snapshot,
  history growing, push) as the summary. Clarify slide.

---

## Part 4: Team work (11:30-11:50, 20 min)

Slides: Team work (Arti before/after) -> Find your partner -> Your turn (the push
wall) -> What just happened? -> Match the Git command exercise -> Lunch.

No My turn in this Part; it is the collaboration cliffhanger. 20 minutes is
tight but doable: keep the debrief to two sentences and let the Match-the-command
handout spill into the start of lunch rather than eating the core.

### Find your partner (4 min)

- Neighbour pairs (triple if odd). Write each other's GitHub username on the
  sticky notes. The sticky note is the pairing record and returns in Part 6.

### Your turn: the push wall (12 min, countdown 10)

- Clone the **partner's** `website` repo into `gitrepos/gh-PARTNER`, edit the
  README, run the mantra Pull-Stage-Commit-Push.
- Everyone hits the **403, no write access**. Lowest-stakes failure of the day,
  by design. Sticky note / "blocked" in chat when it happens.

### Debrief: What just happened? (3 min)

- Read but no write; collaborator access exists but does not scale; fork in one
  sentence, not taught today.
- **Cliffhanger, do not resolve**: "After lunch we solve this properly, with
  branches and pull requests. But before that, one last exercise."

### Match the Git command to the button (handout, flexes into lunch)

- Hand it out at the tail of the block; 3 min on your own (countdown 3), then
  restart for 5 min comparing with your partner. The point: clicking a button
  runs the same command a terminal user types. If the room is already at the
  lunch boundary, they carry it into lunch or we review it right after; it does
  not need to finish inside the 20 minutes.

### Lunch slide

- Hard return time. The afternoon starts hands-on; your partner is waiting.

---

## Lunch (11:50-12:45, 55 min)

Eat, then cue the afternoon deck at Part 5; the drawing build-ups for 3 and 4
share one story. Confirm partner pairs are recorded.

---

## Part 5: Work on a branch (12:45-13:05, 20 min)

Slides: Arti's branch (before/after) -> My turn -> Your turn -> Branching
(drawing 3).

### My turn (12 min) [DEMO SCRIPT]

Repo: the team manuscript repo `washinvestments-<team>`.

1. Clone the team manuscript repo (same moves as this morning). (3)
2. Git pane: **New Branch**, name it `dev`. Read the message about origin out
   loud. (2)
3. Open `manuscript.qmd`, edit the author details, **Render**. Packages are
   pre-installed from pre-work, so render takes seconds. If a render fails on a
   missing package, the commented install chunk is at the top of `manuscript.qmd`; do
   not run installs for the room, park that learner. (3)
4. Switch between `main` and `dev` in the Git pane: before the commit nothing
   differs; after the commit, the change lives only on `dev`. (2)
5. Commit "update author details", push. (2)

The branch created here feeds the pull request in Part 6, so keep momentum.

### Your turn (as fits, countdown 10)

- One person drives per team. Find and clone the team's `washinvestments-<team>`
  repo, New Branch `dev`, put own author details into one of the two author
  slots, Render, then PSCP with the message "update author details". Sticky note
  when the push finishes.
- Regroup check before Part 6: "Is your branch pushed? Thumbs up."
- Branching drawing (build-up: main line, dev split, dev commits, empty merge
  point) as the summary. Say: "we finish this picture in the next block."

---

## Part 6: Pull request, review, merge (13:05-13:45, 40 min) [PROTECTED]

Slides: Review (Arti before/after) -> My turn -> Your turn -> The pull request
(drawing 4).

### My turn (12 min) [DEMO SCRIPT]

Repo: the team manuscript repo, `dev` branch from Part 5.

1. On GitHub: switch to `dev`, click **Compare & pull request**. Title: "Add
   author details to manuscript". (2)
2. Request a reviewer. Walk the tabs: **Commits**, **Files changed**. (2)
3. As the reviewer: start a review, leave line comments, submit. Reuse verbatim:
   "That's not a good title for a manuscript. Please suggest 2 alternatives." and
   "This list is not complete." (3)
4. Open an **issue with a task list** next to the PR. Merge the PR, confirm, tick
   off the task in the issue. (2)
5. Back in RStudio: switch to `main`, read "behind origin/main, can be
   fast-forwarded" out loud, **Pull**. (1)
6. **The gotcha, say as a habit**: "Merged? Then pull `main`, and switch back to
   `dev`." (1)

### Your turn (17 min, countdown 15)

Two roles, then swap, so everyone opens a PR and reviews one.

- **Author**: open a PR from `dev`, request review from the sticky-note partner;
  read the review, then either make the proposed changes and push again or merge
  as is; in RStudio switch to `main`, Pull, switch back to `dev`.
- **Reviewer**: open the partner's PR, leave at least one line comment, add an
  overall comment, submit.
- Everyone has read access to the partner's repo, so nobody is blocked. Sticky
  note after the switch back to `dev`, then swap roles.
- Target: every learner opens a PR, writes a line comment, merges, pulls, inside
  the block. **Never cut this block.** If behind, Part 7 dies, not Part 6.
- The pull request drawing (build-up: open merge point, PR, human review at the
  join, merge) as the summary.

---

## Movement Break (13:45-13:50, 5 min)

Get up and move.

---

## Part 7: Merge conflict (13:50-14:00, 10 min) [FIRST TO CUT]

Slides: Arti's conflict (before/after) -> My turn -> Resolving a conflict
(reference). Instructor demo only, no learner exercise.

### My turn (demo only) [DEMO SCRIPT]

Repo: the team manuscript repo.

1. Set up the clash on purpose: on GitHub, edit one line of `manuscript.qmd` on `main`
   directly (for example the manuscript title) and commit.
2. In RStudio, on `dev`, edit the same line differently. Commit.
3. **Pull.** Git stops and reports a conflict in `manuscript.qmd`.
4. Open the file. Walk the conflict markers out loud: `<<<<<<< HEAD` is your
   version, `=======` is the divider, `>>>>>>>` is the incoming version.
5. Choose: delete the markers, keep the line you want (or combine both). Save.
6. Stage, Commit ("resolve conflict in title"), Push.
7. **Say the safety message**: Git never threw away either edit; it handed you
   both and waited. A conflict is Git protecting your work, not breaking it.

Reference slide "Resolving a conflict" stays up for learners to look back at.

If behind at 13:50: skip the demo, one breath ("a conflict is Git refusing to
guess; you choose, nothing is lost"), hand the time to Part 8.

---

## Part 8: Concept map revisit and wrap-up (14:00-14:30, 30 min) [PROTECTED, HARD START]

Slides: Your turn (second map) -> What you learned today -> Why this matters ->
What you also learned -> What comes next -> Feedback and thanks.

### Your turn: the second map (15 min, countdown 15)

- "Draw a concept map of Git and GitHub as you understand them now. Use the words
  from today: repository, clone, commit, push, pull, branch, pull request, merge,
  review." (5 min drawing)
- Pin it on the wall next to the morning map (5 min). Walk to your team member's
  two maps and talk through what changed (5 min).
- Consent asked on the slide: photograph both maps, anonymously, for the
  retrospective. (Consent request also went out by email ahead of the workshop.)
- Fallback if the baseline went badly in Part 1: I draw the Git map on the board,
  room calls out the verb for each arrow.

### Wrap-up (as fits)

- **What you learned today**: the three objectives, done. Commit cycle,
  Collaboration, Concept map.
- **Why this matters**: issues, commit messages, PR reviews are visible to other
  people; they show how you work and communicate, and that signal grows as more
  content is AI-generated. The issue tracker is a TODO list attached to the work;
  tasks live on the repository and stay there after they close, next to the
  commits that resolved them.
- **What you also learned**: RStudio fluency, a first taste of Quarto,
  reversibility as a habit.
- **What comes next**: the GitHub Project and Task Management workshop
  (tentatively 26 August, 09:30-14:30) builds on today; and an offer to work with
  me on a small, free personal website to practice branching, PRs, and reviews.
  The agentic-coding workshop is the longer horizon.
- **Feedback**: survey link out by email while the slide is up. End on momentum,
  done by 14:30.

---

## After the room empties

- Photograph consenting learners' map pairs (baseline and closing).
- Collect the parked-problem list from the helper; answer open questions the same
  week.
- Note actual per-block times on this plan for the retrospective.
