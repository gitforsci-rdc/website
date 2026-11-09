# Concept drawings

The four build-up drawings on the slides are hand-drawn in Excalidraw. Each
drawing is one scene with an ordered set of elements, revealed one stage per
slide fragment.

## Files per drawing

- `drawing-N-<name>.excalidraw`: the editable Excalidraw source (the master).
- `drawing-N-<name>.png`: the full drawing, all elements shown.
- `drawing-N-<name>-00.png` .. `-0k.png`: the cumulative fragment sequence used
  on the slides. Frame `-00` shows the first stage; each later frame adds the
  next group of elements. The slide stacks them with `.r-stack` and reveals one
  per press with `.fragment .fade-in`.

## Regenerating the fragments

The fragments are rendered from the `.excalidraw` sources with a headless
Chromium (puppeteer) that loads the real `@excalidraw/excalidraw` bundle, so
the hand-drawn look and the Virgil font are preserved. Which elements belong to
each stage is defined in `drawing-stages.json` by element index.

To regenerate after editing a source:

1. In a scratch directory, install the tooling:
   `npm install puppeteer @excalidraw/excalidraw@0.17.6 react@18 react-dom@18`
   and copy `Virgil.woff2` out of the excalidraw `dist/excalidraw-assets/` folder.
2. Keep `drawing-stages.json` in sync with the element order in the source. List the
   element indices with a short Node script that reads the `.excalidraw` JSON and
   prints `elements[i].type` / `elements[i].text`.
3. Run the render script: for each frame it keeps every element but sets the
   not-yet-revealed ones to `opacity: 0`, which keeps every frame's exported
   dimensions identical so the fragments stack without shifting.

If you only change wording or colours (not the element count or order), you can
edit the source in the Excalidraw app, re-export the full PNG, and re-run the
fragment render without touching `drawing-stages.json`.
