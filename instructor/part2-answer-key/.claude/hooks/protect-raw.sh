#!/bin/bash
# PreToolUse hook (matcher: Edit|Write). Language-neutral: used by R and Python.
# Block Claude's file tools from editing anything under data/raw/.
# Exit 2 blocks the tool call and sends the message on stderr back to Claude.
FILE_PATH=$(jq -r '.tool_input.file_path // empty')

case "$FILE_PATH" in
  */data/raw/*|data/raw/*)
    echo "Blocked: $FILE_PATH is in data/raw/, which is read-only. Write derived data to output/ instead." >&2
    exit 2 ;;
esac
exit 0
