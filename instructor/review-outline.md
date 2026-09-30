# Material review: outline for two reviewers

A working document for `[Reviewer 1]` and `[Reviewer 2]` to review both classes before they're taught. It isn't rendered to the site. Don't put private details here: they belong in `instructor/README.md`.

- **Review window:** `[start date]` to `[end date]`
- **Target class dates:** Part 1 `[date]`, Part 2 `[date]`
- **Where to view:** the rendered site at `[site URL]` (or run `quarto preview` locally)

## 1. How we'll review

| Step | Who | What | When |
|---|---|---|---|
| Kickoff (15 min) | Both | Agree on the split below and the severity scale | `[date]` |
| Pass 1: dry run as a participant | Each on their own part | Follow the class page start to finish in a real Claude account | `[date]` |
| Pass 2: content and accuracy | Each on their own part | Work through the checklists in sections 3 and 4 | `[date]` |
| Swap | Both | Spot-check the other person's part (focus on sections 5 and 6) | `[date]` |
| Wrap-up meeting (30 min) | Both | Go through the findings log, make decisions, assign fixes | `[date]` |

### Who reviews what

| Area | Lead | Second look |
|---|---|---|
| Part 1: `part1.qmd` (page and slides), `part1-reference.qmd`, Part 1 kits | `[name]` | `[name]` |
| Part 2: `part2.qmd`, `part2-slides.qmd`, `cheatsheet.qmd`, hypertension project | `[name]` | `[name]` |
| Shared pages: `index.qmd`, `about.qmd`, both `*-description.md` files | `[name]` | `[name]` |
| Instructor materials: `instructor/README.md`, answer keys, solutions | `[name]` | `[name]` |

### Severity scale

- **Must fix:** wrong facts, broken steps, a data or policy risk, or a timing that doesn't work.
- **Should fix:** confusing wording, a missing step, or a slide that's too dense.
- **Nice to have:** polish and style.

## 2. Questions for the whole review

Answer these once you've done the dry run.

- [ ] Can a participant with no programming experience (Part 1) or light R/Python (Part 2) follow it without help?
- [ ] Does each activity support one of the four learning objectives? Does each objective get practiced?
- [ ] Does the timing feel realistic? Where would we run over?
- [ ] What would we cut first if we ran 10 minutes behind? (The verification segment is the last thing to cut.)
- [ ] Is anything missing that participants will ask about?

## 3. Part 1: Getting started with Claude (60 min)

### Dry run

- [ ] Download Kit A and Kit B from the class page. Do both zips open and contain the expected files?
- [ ] Build the Project, run Turns 1–3 and the "add one rule" step. Do the prompts work as written?
- [ ] Check the answers against the kit answer keys in `instructor/README.md`.
- [ ] Try the model/effort menu, the "+" and "/" menus, and the Word handout skill (if enabled).
- [ ] Open the Project on the phone app.

### Segment checklist (`part1.qmd`)

| # | Segment | Time | Works as written? | Notes |
|---|---|---|---|---|
| 1 | Welcome and sign in | 0:00 – 0:03 | | |
| 2 | Why we check | 0:03 – 0:05 | | |
| 3 | Which tool for which data | 0:05 – 0:11 | | |
| 4 | Lock your settings | 0:11 – 0:15 | | |
| 5 | Watch: build a Project | 0:15 – 0:17 | | |
| 6 | Your turn: build your Project | 0:17 – 0:26 | | |
| 7 | Watch: anatomy of a strong prompt | 0:26 – 0:28 | | |
| 8 | Your turn: run it, then push back | 0:28 – 0:37 | | |
| 9 | Verify before you use it | 0:37 – 0:46 | | |
| 10 | Tune it: model, effort and skills | 0:46 – 0:51 | | |
| 11 | Take it with you: the phone app | 0:51 – 0:55 | | |
| 12 | Cowork and the bridge to Part 2 | 0:55 – 0:57 | | |
| 13 | Exit ticket and close | 0:57 – 1:00 | | |

### Slides (`part1-slides.html`)

- [ ] About 8 lines of body text or fewer per slide; nothing cut off.
- [ ] Long prompts point to the class page instead of appearing on the slide.
- [ ] Speaker notes read well as public Instructor tips on the page (nothing private in them).

### Reference page (`part1-reference.qmd`)

- [ ] Tool and data guidance matches the class page.
- [ ] Settings checklist matches what we see in the app today.
- [ ] Prompt library: try at least one prompt from Research, Teaching, and Administrative.
- [ ] Verify and disclose, Cowork, and Copilot/Clarity sections are accurate.

## 4. Part 2: Analyzing research data with Claude Code (90 min)

### Dry run

- [ ] Follow "Before class" and the Part 2 setup on `index.qmd` on a clean machine (Positron, R, git, the extension).
- [ ] Download the hypertension project zip and open it in Positron.
- [ ] Run segments 2–6 in the extension panel. Note anything that only works in the terminal CLI.
- [ ] Compare results to the answer key (`instructor/README.md` and `instructor/part2-answer-key/`).
- [ ] Do the planted data problems surface the way the dataset spec says they will?
- [ ] Try the Python swap-in (`CLAUDE.python.md`) if we expect Python users.

### Segment checklist (`part2.qmd` and `part2-slides.qmd`)

| # | Segment | Time | Works as written? | Notes |
|---|---|---|---|---|
| 1 | Welcome and setup check | 0:00 – 0:05 | | |
| 2 | Data rules and project setup | 0:05 – 0:17 | | |
| 3 | Plan, build, verify | 0:17 – 0:42 | | |
| – | Break / catch-up | 0:42 – 0:47 | | |
| 4 | Working well | 0:47 – 0:57 | | |
| 5 | Extending Claude Code | 0:57 – 1:12 | | |
| 6 | Messy real-world sources | 1:12 – 1:20 | | |
| 7 | Verification and research integrity | 1:20 – 1:27 | | |
| 8 | Wrap-up | 1:27 – 1:30 | | |

### Slides and cheat sheet

- [ ] The slides follow the same order and content as `part2.qmd`.
- [ ] Commands and keys on `cheatsheet.qmd` work in the current extension version.
- [ ] Instructor-only callouts (prep checklist, run of show, backup plans) are complete.

## 5. Accuracy and policy (both parts)

- [ ] **No real patient data** anywhere: only the synthetic cohort, the synthetic kits, or public de-identified data.
- [ ] **No institutional approval claims.** The HIPAA-supported version is mentioned only with a `[request link]`, and nothing says the standard account covers PHI.
- [ ] Admin-dependent features are marked **(if enabled)**: connectors, code execution, skills, Research, Cowork, Remote Control, Claude Code seats.
- [ ] Uncertain menu labels are marked "(check before class)" on pages and Instructor tips.
- [ ] Feature claims match the [Claude Help Center](https://support.claude.com) and the [Claude Code docs](https://code.claude.com/docs) as of the review date.
- [ ] All links work, and Claude Academy is in each recommended links list.
- [ ] Learning objectives match word for word across files (Part 1: `part1.qmd`, `part1-description.md`, `index.qmd`; Part 2: `part2.qmd`, `part2-slides.qmd`, `part2-description.md`, `index.qmd`).

## 6. Accessibility and style

- [ ] Plain, short sentences; no unexplained jargon.
- [ ] Headings in order; link text makes sense out of context.
- [ ] Images have alt text; color contrast is fine in light and dark mode.
- [ ] Slides readable from the back of SHM L 111.
- [ ] Sample prompts are in copyable code blocks.

## 7. Decisions we need to make

| Decision | Options | Decision and owner |
|---|---|---|
| License and footer wording for the public site | `[options]` | |
| Part 2 restructure (more verification time, shorter feature tour, catch-up download) | Adopt the draft agenda / keep the current one | |
| Rewording the fourth Part 2 objective (commands are now skills) | `[proposed wording]` | |
| Bracketed placeholders still to fill (site URL, HIPAA request link, contacts, policy links) | Who confirms each one | |
| `[add more]` | | |

## 8. Findings log

One row per issue. Use the file and section heading so we can find it.

| # | File and section | Issue | Severity | Suggested fix | Reviewer | Status |
|---|---|---|---|---|---|---|
| 1 | | | | | | |
| 2 | | | | | | |
| 3 | | | | | | |

## 9. After the review

- [ ] Apply the fixes, updating each class page and its slides together.
- [ ] Update `about.qmd`: the "features last checked" date, the next review date, and a corrections log row for each fix to a fact, link, or instruction.
- [ ] Re-render the site and spot-check the changed pages.
- [ ] Move private items (demo account, room logistics, answers) into `instructor/README.md` if any turned up.
