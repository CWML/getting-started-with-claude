#!/bin/bash
# PostToolUse hook (matcher: Edit|Write).
# After Claude edits an R or Quarto file: restyle it with styler, then lint it with lintr.
# Exit 2 sends the lint findings back to Claude so it can fix them.
# Check before class: if your styler/lintr versions don't handle .qmd, limit this to *.R.
FILE_PATH=$(jq -r '.tool_input.file_path // empty')

case "$FILE_PATH" in
  *.R|*.r|*.qmd|*.Rmd) ;;
  *) exit 0 ;;
esac

Rscript -e 'invisible(styler::style_file(commandArgs(TRUE)[1]))' "$FILE_PATH" >/dev/null 2>&1

LINTS=$(Rscript -e 'l <- lintr::lint(commandArgs(TRUE)[1]); if (length(l)) print(l)' "$FILE_PATH" 2>&1)
if [ -n "$LINTS" ]; then
  echo "lintr found issues in $FILE_PATH:" >&2
  echo "$LINTS" >&2
  exit 2
fi
exit 0
