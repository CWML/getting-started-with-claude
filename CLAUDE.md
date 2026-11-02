# Claude & Claude Code at the School of Medicine: Course Materials

Teaching materials for two medical library classes:
- **Part 1: Getting started with Claude** (60 min; may grow to 90). AIR curriculum label: Track A Foundations · Beginner. A hands-on Project workshop in the Claude app for anyone at the School of Medicine: patrons, staff, researchers, clinicians, and students. Every participant builds one Project (Kit A Article Explainer by default, or Kit B Committee Assistant for administrative staff) and runs one multi-part prompt, then checks the answer. It covers important settings such as memory and incognito, and the app's controls: the model/effort menu next to Send, the "+" menu and typing "/" in the chat box, skills, and the phone app. It names the Claude Code equivalents (/model, /effort, /rc) side by side as a bridge to Part 2, but doesn't teach Claude Code. There's no data cleaning or analysis. Cowork gets only a brief overview: it isn't for high-risk data, and the HIPAA-supported version may not include it.
- **Part 2: Analyzing research data with Claude Code** (90 min). AIR curriculum label: Track C Computational Research · Intermediate. Claude Code mainly through the extension panel in Positron or VS Code, with the terminal CLI only where the panel can't do something. It uses the synthetic hypertension project.

Participants use Claude accounts obtained through departmental sign-up. Each part has four learning objectives based on Bloom's taxonomy.

## Files
The repo is a Quarto website published to GitHub Pages (see `README.md`). Keep the file count low: there are no separate handouts or instructor guides.
- `part1.qmd`: the Part 1 class page. Instructors teach from it directly on the projector; there is no Part 1 deck. `##` segments carry the timing, and `###` marks sub-segments. The page is public, so instructor notes (timing, what to say, cut order) and private details such as the demo account live only in `instructor/README.md`, never in `part1.qmd`. Don't add speaker notes or Instructor tip callouts.
- `part1-reference.qmd`: the Part 1 quick reference page (tool and data, settings, Projects and skills, model/effort and commands, mobile, prompt library, verify and disclose, Cowork, Copilot, where to go next).
- `materials/part1-kits/`: the Part 1 Project files. Kit A (Article Explainer: style guide plus an open-access article copy) and Kit B (Committee Assistant: a synthetic committee pack), plus a `README.md`. `scripts/build_downloads.py` zips each kit at render time.
- `part2.qmd`: the single Part 2 page the instructor teaches from and participants follow. Instructor-only content (prep checklist, run of show, instructor notes, backup plans) goes in collapsed callouts. `part2-slides.qmd` is its revealjs deck with speaker notes.
- `index.qmd` (home + setup, access and alternatives, recommended links), `cheatsheet.qmd` (Part 2), and `about.qmd` (owner, features last-checked date, review cadence, corrections log, AI-use disclosure, license).
- `part1-description.md` and `part2-description.md`: each class's entry for the library's training request form (title, modality and location, duration, description, learning objectives, category, registration, attendee cap; not rendered). Both classes are in person in SHM L 111, registration required, cap 18.
- `theme/`: a Quarto adapter for the CWML web style (draft 0.1): `cwml.scss`, `cwml-dark.scss` (dark mode, a local extension that isn't part of CWML 0.1), `cwml-reveal.scss` (the Part 2 deck), and `skip-link.html`.
- `materials/hypertension-cohort/`: the Part 2 practice project, downloaded as one zip (`CLAUDE.md` for R, `CLAUDE.python.md` as the Python swap-in, REDCap exports, a `data/restricted/` stand-in, and `legacy/` code).
- `instructor/` (not rendered): `README.md` (Part 1 prep checklist, private run-of-show details, kit answer keys, backup plans; the dataset spec, which is the source of truth for variable names and planted problems; and the Part 2 answer keys), `make_data.R`, `solutions/`, `part2-answer-key/`, and `review-outline.md` (a checklist for two reviewers to review both classes).

Objectives match word for word across files, so change them everywhere at once. Part 1: `part1.qmd`, `part1-description.md`, and `index.qmd`. Part 2: `part2.qmd`, `part2-slides.qmd`, `part2-description.md`, and `index.qmd`.

Site pages must not contain executable `{r}`/`{python}` chunks. Use plain fenced blocks so the site renders without R or Python. When you change Part 2 content, update the class page and its slides together.

## Session structure
The agenda in `part1.qmd` / `part2.qmd` is the source of truth for timings. Part 1 sums to 60 minutes and Part 2 to 90.

If you change a segment's length, update both the agenda table and the segment headings (and the slide notes).

## Content rules
- **Never use real patient data** in examples, exercises, or demos. Use the synthetic class cohort, the synthetic kit files, or public de-identified data only (NHANES, Synthea). Don't suggest controlled-access datasets (MIMIC, dbGaP, UK Biobank) for demos.
- **Don't claim institutional approvals.** Yale offers a HIPAA-supported version of Claude by request, and you may say so with a `[request link]`. Don't claim that it approves any project, feature, or data set, and don't state that the standard enterprise account covers PHI or any data classification. Features in the HIPAA-supported version may differ (some off, older layout): "check with [ITS]". Use `[bracketed placeholders]` for every other approval and local detail: sign-up links, policy links, ITS/HSIT contacts, enabled connectors, site URL.
- **Product features change often.** Describe Claude app and Claude Code features in terms the instructor can check, and mark features that depend on admin settings (connectors, code execution, skills, Research, Cowork, Remote Control, Claude Code seats) as "if enabled." Mark uncertain menu labels "(check before class)" on pages and in instructor notes, not on slides.
- Keep the verification/research integrity segment when trimming for time. It's the last thing to cut.
- Match the audience: assume no programming experience in Part 1 and only light R/Python in Part 2. Part 1 uses general academic, clinical-education, and administrative tasks, with no datasets. Prefer R (tidyverse) and Quarto in code examples, and use biomedical examples (clinical cohorts, REDCap exports, SAS/SPSS/Stata legacy code).
- Use **Positron** as the IDE for Claude Code demos, with VS Code as the alternative. The Claude Code extension panel is the main surface; when something only works in the terminal CLI, say so.
- Recommended links (home page, Part 1's "Where to go next" and reference page, and Part 2) include Claude Academy: `https://academy.claude.com` ("Claude Academy: free courses from Anthropic").

## Content lifecycle
When you change content or re-check features, update `about.qmd`: the "features last checked" date, and a row in the corrections log for any fix to a fact, link, or instruction.

## Style
- Markdown, with `##` for segments and `###` for sub-segments . Put timing in the segment headings, e.g. `(0:20 – 0:47)`.
- Put sample prompts in fenced code blocks (```` ```text ````) so they're easy to copy during class.
- Use tables for comparisons and checklists for prep tasks.
- Write in plain, short sentences. Keep slides to about 8 lines of body text.
