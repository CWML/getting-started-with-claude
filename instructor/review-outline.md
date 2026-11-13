# Material review: outline for two reviewers

A working document for `[Reviewer 1]` and `[Reviewer 2]` to review both classes before they're taught. It isn't rendered to the site. Don't put private details here: they belong in `instructor/README.md`.

- **Review window:** `[start date]` to `[end date]`
- **Target class dates:** Part 1 `[date]`, Part 2 `[date]`
- **Where to view:** the rendered site at `https://cwml.github.io/getting-started-with-claude` (or run `quarto preview` locally)

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
| Part 1: `part1.qmd` (class page), Part 1 kits | `[name]` | `[name]` |
| Part 2: `part2.qmd`, the NHANES practice project (`materials/nhanes-bp/`) and the checkpoint zip | `[name]` | `[name]` |
| Shared pages: `index.qmd`, both `*-description.md` files | `[name]` | `[name]` |
| Instructor materials: `instructor/README.md`, answer keys, solutions | `[name]` | `[name]` |

### Severity scale

- **Must fix:** wrong facts, broken steps, a data or policy risk, or a timing that doesn't work.
- **Should fix:** confusing wording, a missing step, or a slide that's too dense.
- **Nice to have:** polish and style.

## 2. Questions for the whole review

Answer these once you've done the dry run.

- [ ] Can a participant with no programming experience (Part 1) or light R (Part 2) follow it without help?
- [ ] Does each activity support one of the four learning objectives? Does each objective get practiced?
- [ ] Does the timing feel realistic? Where would we run over?
- [ ] What would we cut first if we ran 10 minutes behind? (The verification segment is the last thing to cut.)
- [ ] Is anything missing that participants will ask about?

## 3. Part 1: Getting started with Claude (60 min)

### Dry run

- [ ] Download Kit A and Kit B from the class page. Do both zips open and contain the expected files?
- [ ] Build the Project, run Turns 1–3 and the "add one rule" step. Do the prompts work as written?
- [ ] Check the answers against the kit answer keys in `instructor/README.md`.
- [ ] Check the model/effort menu, the "+" and "/" menus, and Customize > Skills (if enabled).
- [ ] Open the Project on the phone app.

### Segment checklist (`part1.qmd`)

| # | Segment | Time | Works as written? | Notes |
|---|---|---|---|---|
| 1 | Welcome and sign in | 0:00 – 0:03 | | |
| 2 | Trust but verify | 0:03 – 0:05 | | |
| 3 | Which Claude for which data | 0:05 – 0:08 | | |
| 4 | Getting around the app | 0:08 – 0:10 | | |
| 5 | Check your settings | 0:10 – 0:16 | | |
| 6 | Everyday chat | 0:16 – 0:19 | | |
| 7 | Models, effort and skills | 0:19 – 0:24 | | |
| 8 | Watch: build a Project | 0:24 – 0:26 | | |
| 9 | Your turn: build your Project | 0:26 – 0:35 | | |
| 10 | Watch: anatomy of a strong prompt | 0:35 – 0:37 | | |
| 11 | Your turn: run it, then push back | 0:37 – 0:46 | | |
| 12 | Verify before you use it | 0:46 – 0:55 | | |
| 13 | Take it with you: the phone app | 0:55 – 0:57 | | |
| 14 | Cowork and the bridge to Claude Code | 0:57 – 0:59 | | |
| – | Where to go next (close) | 0:59 – 1:00 | | |

### Teaching from the page

- [ ] Each section reads well on the projector from the back of the room; nothing important needs scrolling mid-explanation.
- [ ] The segment notes in `instructor/README.md` match the page, in order, with the right timings.
- [ ] Nothing on the page is meant for instructors only.

## 4. Part 2: Analyzing research data with Claude Code (90 min)

Two instructors teach it from the class page (no slide deck): L, the lead at the projector, and R, the roamer and timekeeper. The run of show, checkpoints and cut order are in `instructor/README.md`.

### Dry run

- [ ] Follow "Before class" and the setup on `index.qmd` (`#setup-part2`) on a clean machine: Positron, R with `survey` and `haven`, git, the extension. Do both smoke-test prompts work?
- [ ] Rehearse once on Windows: Extract All nested folder, OneDrive Documents, CRLF warnings, `Rscript` on PATH.
- [ ] Download `nhanes-bp.zip` and `nhanes-bp-checkpoint.zip`. Do both unzip to `nhanes-bp/` with the expected files?
- [ ] Work through the page in the extension panel. Note anything that only works in the terminal CLI.
- [ ] Does the deny test give a permission-denied message, not a polite refusal?
- [ ] Is the plan-approval label "Yes, and manually approve edits" still right in Positron? (Checked in extension 2.1.319 on 2026-11-10.)
- [ ] Compare your n flow and prevalence with the answer key in `instructor/README.md` (8,153 → 6,337 → 6,123 → 6,084; 47.7%, 45.4–49.9).
- [ ] Do the tests fail on the unprepared merge and pass on the prepared data?
- [ ] Does the checkpoint zip let someone who fell behind finish the estimate and verification sections?

### Section checklist (`part2.qmd`)

Times come from the run of show in `instructor/README.md`; the page itself shows none.

| # | Section | Time | Works as written? | Notes |
|---|---|---|---|---|
| 1 | Open the project | 0:00 – 0:05 | | |
| 2 | What Claude sees, and who's in control | 0:05 – 0:16 | | |
| 3 | Plan before you code | 0:16 – 0:29 | | |
| 4 | Build the prepare script | 0:29 – 0:44 | | |
| 5 | Check it yourself | 0:44 – 0:52 | | |
| – | Break / catch-up | 0:52 – 0:57 | | |
| 6 | Estimate, then decide what to report | 0:57 – 1:08 | | |
| 7 | Verification and research integrity | 1:08 – 1:22 | | |
| 8 | Working well, and skills | 1:22 – 1:26 | | |
| 9 | Wrap-up | 1:26 – 1:30 | | |

### Teaching from the page and instructor notes

- [ ] Each section reads well on the projector from the back of SHM L 111; prompts are easy to copy.
- [ ] The page has no times except the four "aim to finish" lines, and nothing meant for instructors only.
- [ ] The class goal is near the top and again in the wrap-up, and each hands-on step says what Claude does and what you decide.
- [ ] The page never says "Part 2" or "Part 1," and doesn't call the class an intro or beginner class.
- [ ] Commands, keys and menu labels on `part2.qmd` work in the current extension version.
- [ ] The prep checklist, run of show, section notes and backup plans in `instructor/README.md` are complete and match the page. Do the L and R duties work for two people?
- [ ] Data Brief 511 is revealed only after participants run their own scripts.

## 5. Accuracy and policy (both parts)

- [ ] **No real patient data** anywhere: only the synthetic Part 1 kits, the public de-identified NHANES files (Part 2), and the fictional `data/restricted/` stand-in.
- [ ] Part 2: the NCHS data user agreement points (statistical analysis only, no re-identifying, no linking) are on the page, with the CDC attribution.
- [ ] **No institutional approval claims.** The HIPAA-supported version is mentioned only with a `[request link]`, and nothing says the standard account covers PHI.
- [ ] Admin-dependent features are marked **(if enabled)**: connectors, code execution, skills, Research, Cowork, Remote Control, Claude Code seats.
- [ ] Uncertain menu labels are marked "(check before class)" on pages and in instructor notes.
- [ ] Feature claims match the [Claude Help Center](https://support.claude.com) and the [Claude Code docs](https://code.claude.com/docs) as of the review date.
- [ ] All links work, and Claude Academy is in each recommended links list.
- [ ] Learning objectives match word for word across files (Part 1: `part1.qmd`, `part1-description.md`, `index.qmd`; Part 2: `part2.qmd`, `part2-description.md`, `index.qmd`).

## 6. Accessibility and style

- [ ] Plain, short sentences; no unexplained jargon.
- [ ] Headings in order; link text makes sense out of context.
- [ ] Images have alt text; color contrast is fine in light and dark mode.
- [ ] Class pages readable on the projector from the back of SHM L 111.
- [ ] Sample prompts are in copyable code blocks.

## 7. Decisions we need to make

| Decision | Options | Decision and owner |
|---|---|---|
| License and footer wording for the public site | `[options]` | |
| Part 2 restructure (real NHANES data, R only, no deck, catch-up zip, advanced topics named only) | Decided 2026-11-10: adopted | Class lead |
| Part 2 objectives (Configure, Implement, Distinguish, Evaluate) | Decided 2026-11-10: adopted in `part2.qmd`, `part2-description.md` and `index.qmd` | Class lead |
| Bracketed placeholders still to fill (HIPAA request link, contacts, policy links) | Who confirms each one | |
| `[add more]` | | |

## 8. Findings log

One row per issue. Use the file and section heading so we can find it.

| # | File and section | Issue | Severity | Suggested fix | Reviewer | Status |
|---|---|---|---|---|---|---|
| 1 | | | | | | |
| 2 | | | | | | |
| 3 | | | | | | |

## 9. After the review

- [ ] Apply the fixes, updating each class page and its instructor notes together.
- [ ] If you re-checked features, update the date in `instructor/README.md`.
- [ ] Re-render the site and spot-check the changed pages.
- [ ] Move private items (such as demo account details) into `instructor/README.md` if any turned up.
