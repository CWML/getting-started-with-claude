# Part 2 answer key (instructor only)

These are the finished versions of the Claude Code configuration built in Part 2 (Analyzing research data with Claude Code). They're laid out the way they sit in the demo project, so you can copy them straight in.

- **Participants build their own versions** in class, using the prompts on the class page (`part2.qmd`). Don't hand them this folder up front.
- **The instructor copies these files into the demo project** for the Segment 5 demos, or uses them as a fallback when a demo stalls or a participant is stuck.

## How this fits the class flow

The participant zip, `hypertension-cohort.zip`, contains **no analysis scripts and no cleaned data**. Its `R/`, `output/`, and `reports/` folders are empty. In Exercise 1 (Segment 3), participants have Claude write and run `R/01_clean.R`, which creates `output/cohort_clean.csv` and `output/cleaning_log.csv`. The files here assume that has already happened:

- The **Table 1 skill** and the **tests** read `output/cohort_clean.csv`. Run `R/01_clean.R` before you demo them.
- The **reviewer subagent** reviews `R/01_clean.R` and `R/03_primary_model.R`, so those scripts must exist.
- The `/check-data` skill and the `data/raw/` hook work on the raw files and need nothing else.

For the demo project, take the scripts from `instructor/solutions/R/` (the Exercise 1 answer key), not from the zip. The class page's instructor callout builds a `part2-start` tag (the bare zip) and a `part2-complete` tag (solutions + outputs + this folder), so you can pull in any piece with `git checkout part2-complete -- <path>`.

Variable names follow the dataset spec in `instructor/README.md`. Rehearse every file on your Claude Code version, in Positron's extension panel, before class.

The files are **R only**. For a Python demo, ask Claude to convert them (for example, the Table 1 skill to pandas or `tableone`, the tests to `pytest`, and the style hook to `ruff format` and `ruff check`), then rehearse the converted versions.

## What's here

| File | Class segment | What it is |
|---|---|---|
| `.claude/settings.json` | 2c, 5b | Manual mode for terminal sessions, allow/ask/deny rules (including `Read(./data/restricted/**)`), the sandbox, and both hooks |
| `.claude/skills/check-data/SKILL.md` | 5b, Exercise 2 Option A | The `/check-data <file>` skill. `disable-model-invocation: true` means it runs only when you type it. (Older versions of this class used `.claude/commands/check-data.md`; custom commands still work, but they've been merged into skills.) |
| `.claude/skills/table1/SKILL.md` + `conventions.md` | 5b, Exercise 2 Option B | The Table 1 skill (`/table1 [group]`, or loaded automatically) |
| `.claude/agents/biostat-reviewer.md` | 5b, 7 | Read-only "skeptical biostatistician" subagent |
| `.claude/hooks/protect-raw.sh` | 5b | `PreToolUse`: blocks edits to `data/raw/` and explains why |
| `.claude/hooks/style-r.sh` | (mention only) | `PostToolUse`: runs styler, then lintr, and sends lint findings back to Claude |
| `.claude/rules/quarto-reports.md` | (optional) | Path-scoped rule that loads only for `reports/**/*.qmd` |
| `CLAUDE-additions.md` | 2b (optional) | Sections to add to the project's `CLAUDE.md` (SAP import, checks, compaction) |
| `.mcp.json` | Try at home | Placeholder project MCP server. Use it **only if your institution approves the server.** |
| `tests/run_checks.R`, `tests/testthat/test-cleaning.R` | 7 | testthat checks for `output/cohort_clean.csv` |

## Build the demo project

Run these from the repo root, with `DEMO` set to an unzipped copy of the participant zip (outside this repo):

```bash
DEMO=~/Documents/hypertension-cohort          # adjust to your path
KEY=instructor/part2-answer-key

cp instructor/solutions/R/*.R "$DEMO/R/"
cp instructor/solutions/R/report.qmd "$DEMO/reports/"
cp -R "$KEY/.claude" "$KEY/tests" "$DEMO/"
chmod +x "$DEMO"/.claude/hooks/*.sh

cd "$DEMO"
for s in R/0*.R; do Rscript "$s"; done     # writes output/, incl. cohort_clean.csv
quarto render reports/report.qmd
Rscript tests/run_checks.R                 # should pass
```

Optionally, paste `CLAUDE-additions.md` into `$DEMO/CLAUDE.md` (see the comment at the top of that file). Copy `.mcp.json` only if an approved server is available, and replace its placeholders first.

Add these lines to the demo project's `.gitignore`:

```
.claude/settings.local.json
.claude/worktrees/
CLAUDE.local.md
```

## Requirements and checks

- **Permission mode in the extension:** `"defaultMode": "default"` in `.claude/settings.json` applies to terminal sessions only. The VS Code/Positron extension never reads a project's settings for the starting permission mode. In the panel, pick **Manual** from the mode indicator, or set `claudeCode.initialPermissionMode` to `manual` in your editor's *user* settings. The permission rules, sandbox, and hooks in this file do apply in the panel.
- Both hooks need `jq`, and the R hook needs `styler` and `lintr`. Confirm that the PATH hooks run with can find `jq` and `Rscript`, including when Positron launches the extension.
- **Check before class:** whether your installed `styler` and `lintr` handle `.qmd` files. If they don't, limit `style-r.sh` to `*.R`. A `.lintr` file in the project sets line length and other preferences, so the hook doesn't fight your house style.
- With `"sandbox": {"enabled": true}`, commands that reach new network hosts (e.g., `install.packages()`) prompt or fail. Install packages before class. The sandbox runs on macOS, Linux, and WSL2, not native Windows.
- These files were checked with `python3 -m json.tool` (JSON) and `bash -n` (hooks). The tests pass against the output of `instructor/solutions/R/01_clean.R` run on a copy of the starter project.
