#!/bin/bash

BR_LAST_MERGE_COMMIT=198bdaadd03f75fe959c21089c354d36c90069bc
DIFF_FILE=buildroot.batocera.diff

# List the files that differ from the last merged Buildroot state, excluding
# the files owned by batocera itself.
git diff --name-only "$BR_LAST_MERGE_COMMIT" |
    grep -vE '^(board/batocera/|configs/batocera-|scripts/linux|package/batocera/|\.gitignore$)' > "$DIFF_FILE"
