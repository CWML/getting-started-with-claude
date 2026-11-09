# Instructor materials

Everything here is for the instructor: the dataset spec, the script that generates the data, and the answer keys. Participants only download what's in `materials/` (the Part 1 kits and the Part 2 practice project). **All data are synthetic.** The one exception is the Kit A article, a real open-access paper that keeps its own license.

| Path | What it is |
|---|---|
| `README.md` | This file: Part 1 instructor prep (checklist, workspace check, private run-of-show details, segment notes, kit answer keys, backup plans, 90-minute add-backs), Part 2 instructor prep (checklist, run of show, demo reset, segment notes, backup plans), dataset spec, Part 2 answer keys, extra project files, real-dataset ideas, and how to regenerate the data |
| `make_data.R` | Generates the class cohort and the Part 2 REDCap exports (seeded, so the output is the same every time) |
| `solutions/R/`, `solutions/python/` | Answer key and demo fallback for the Part 2 build segment: `01_clean` … `04_figure` and `report.qmd` |
| `part2-answer-key/` | Part 2 answer key: example `.claude/` folder (settings, command, skill, subagent, hooks), tests, and `CLAUDE.md` additions |

## Part 1: instructor prep

Teach from the class page, `https://cwml.github.io/getting-started-with-claude/part1.html`, on the projector. Participants follow the same page on their own screens (QR code at the top), where they copy prompts, download the kits, and find the take-home material. The reference page, `part1-reference.html`, holds the detail that doesn't fit in class. Keep this guide open on a second screen or printed: the segment notes below give the timing and what to say for each part.

The class page is public, so instructor notes and demo account details live in this file only, never in `part1.qmd`.

Claude's features, menu names and admin settings change often. The feature descriptions were checked against the Claude Help Center (support.claude.com) and the Claude Code docs on October 30, 2026. When you re-check them, update this date and the "Last checked" date at the top of `part1-reference.qmd`.

**Prep checklist**

- [ ] Replace every `[bracketed placeholder]` in `part1.qmd`, `part1-reference.qmd`, `index.qmd` and `materials/part1-kits/` (HIPAA-version request link, policy links, HSIT/ITS contacts, site URL). The list below groups them by who can answer.
- [ ] Registration form asks: kit choice (Kit A Article Explainer or Kit B Committee Assistant), Claude tier (standard, premium, HIPAA-supported) and Claude Code access.
- [ ] Line up a co-facilitator for the first 3 minutes (sign-in) and the build block (0:26 – 0:35). Strongly recommended for 18 people.
- [ ] 2–5 days before class, send the sign-in check email: the setup page (`index.html#setup-part1`), "sign in to Claude in a browser and open a new chat," the kit choice, the optional phone app install (with the device policy note), and the "no working account?" section (`index.html#access`).
- [ ] Run the check-in-both-workspaces list below the week before, with screenshots.
- [ ] Pre-run the Kit A Turn 1 chat (with your answers to Claude's questions) for segment 10, "Anatomy of a strong prompt."
- [ ] Build the demo Projects ("Article Explainer"; optionally "Committee Assistant") in the demo account, and share them **Can view** with participants (if sharing is enabled). This is the fallback when uploads fail.
- [ ] Test phone mirroring on the SHM L 111 projector (iPhone Mirroring or QuickTime). Check that the demo Project has synced to the phone app.
- [ ] Clear old demo chats and set the demo account's memory the way you'll teach it, so earlier sessions don't leak into the live demo.
- [ ] Rehearse from the class page with the segment notes below to check the timing.
- [ ] Take backup screenshots: both settings layouts, each Project build step, the model menu, the "+" and "/" menus, Customize > Skills, the Word handout, the phone app and its Code tab.
- [ ] On the published GitHub Pages site, open the kit `.md` links from segment 12 (the article and the committee pack) and check that they show as plain text in the browser and don't download. If they download, tell people to open the file in TextEdit or Notepad instead.

**Placeholders by who can answer** (as of October 31, 2026; site pages only)

Prompt slots such as `[audience]`, `[role]`, `[topic]`, `[committee name]` and `[general knowledge]` are meant for participants. Leave them alone. To find what's left, search the site files for `[`.

| Who | Placeholders | Where |
|---|---|---|
| You / the library | `[Instructor name]`, `[Library name]`; `[QR code]` at the top of the class page | `part1.qmd`, `part2-slides.qmd` |
| You / the library | Forms: `[registration link]`, `[feedback form link]`, `[link to short evaluation form]` | `index.qmd`, `part1.qmd`, `part1-reference.qmd`, `part2.qmd`, `part2-slides.qmd` |
| You / the library | Services: `[office hours link]`, `[library consult link]`, `[literature search consults…]`, `[library evidence synthesis service]`, `[data services consults…]`, `[AIR Tracks B–F offerings]`, `[AIR SIG channel / Teams]` | `index.qmd`, `part1.qmd`, `part1-reference.qmd`, `part2.qmd`, `part2-slides.qmd` |
| You / the library | Guidance: `[library license guidance]`, `[link to library guidance on AI disclosure]`, `[Dated source on AI energy use, chosen by a librarian.]`, `[add category]` (Part 2 form) | `part1.qmd`, `part1-reference.qmd`, kits `README.md`, `part2.qmd`, `part2-description.md` |
| ITS | `[sign-up link]`, `[eligibility…]`, `[who has a license / how to request]`, `[sign-in steps / SSO note]`, `[confirm Yale seat tiers]` (Fable on standard seats), `[Yale retention period…]`, `[whether Yale's agreement allows chats to be used to train models…]`, `[one-line description from ITS]`, `[product name — check]`, `[confirm with ITS which Claude Code surfaces are covered]`, `[ITS contact]`, `[ITS / help contact]`, `[HSIT / ITS AI help]`, `[link to current install instructions]`, `[local guidance for Windows users]`, `[mobile device policy]`, `[how to check / who to ask]` | `index.qmd`, `part1.qmd`, `part1-reference.qmd`, `part2.qmd`, `cheatsheet.qmd` |
| HSIT / HIPAA Privacy Office | `[request link]` (HIPAA-supported version), `[HSIT / HIPAA Privacy Office contact]`, `[Yale data classification / policy link]`, `[Yale data classification names…]`, the six `[approved data: ___, confirmed by ___ on DATE]` cells and four `[classification, confirmed by HSIT on DATE]` cells, `[Yale AI Tool Registry]`, `[link to institutional AI and data policy]`, `[Insert local policy]` | `index.qmd`, `part1.qmd`, `part1-reference.qmd`, `part2.qmd`, `part2-slides.qmd`, `cheatsheet.qmd` |
| Research integrity / teaching | `[HSARG]`, `[Office of Research Integrity]`, `[Poorvu Center / ETI AI teaching guidance]`, `[teaching-center AI guidance]`, `[links to other funder notices]`, `[accessibility contact]` | `part1.qmd`, `part1-reference.qmd`, `index.qmd` |
| Week-before workspace check | The two settings screenshots, `[Record results here]` (Part 2) | `part1-reference.qmd`, `part1.qmd`, `part2.qmd` |

**Check in both Yale workspaces (standard enterprise and HIPAA-supported) the week before, with screenshots**

- [ ] The sidebar labels (Home/Code, New, Search, Projects, Artifacts, Customize, Pinned, Chats) in both workspaces.
- [ ] The Settings > General label for the personal preferences box (older names: Instructions for Claude, profile preferences).
- [ ] The Settings > Memory path and the labels there (as of Nov 9, 2026: Search and reference chats, Generate memory from chats, Import memory, Export memory, then a "You" section). The "Include sensitive topics in memory" toggle is gone; don't teach it. + > Memory must be set before the first message.
- [ ] The Project's "Use account memory" label, and whether there's a way to add typed text to a Project (the "add text" fallback is unverified).
- [ ] Model names and effort levels in the menu next to Send, and whether Fable is available on standard seats [confirm Yale tiers].
- [ ] Incognito retention [30 days by default or Yale's setting], and that files and skills don't run in incognito.
- [ ] Whether skills, code execution and file creation are on, and their HIPAA coverage ("available but not covered" if an Owner turns them back on).
- [ ] Sharing: Can view / Can edit, and whether it's limited to Yale.
- [ ] The "+" menu, and what appears when you type "/" in a new chat (skills, connectors, styles as `/name-style`). Teach only what you see.
- [ ] Projects visible in the phone app, the mobile app in the HIPAA-supported workspace, and whether the phone app has a Code tab.
- [ ] /rc (Remote Control) status in the HIPAA configuration (expected off).
- [ ] The Cowork layout (built into Enterprise chat since Oct 23, 2026, if enabled; the HIPAA workspace keeps the older layout).
- [ ] The Hickey article: the license version on the PMC page, and whether the full text explains 98 vs 99.
- [ ] Org usage headroom for 18 people running multi-part prompts.

**Run of show: private details**

- **Demo account:** `[demo account name]`, signed in on the presenter laptop (second browser tab, finished Article Explainer Project open) and the demo phone. One pre-run chat ready: Turn 1 with Claude's questions answered (segment 10). Don't teach from a personal account.
- **Checkpoint at 0:34:** ask who still needs help. The Project works when Claude names the kit's files (both for Kit A, the one for Kit B) and quotes one rule. The co-facilitator goes to anyone stuck. Move on at 0:35 regardless; people catch up during Turn 1.
- **Timing anchors:** build starts 0:26; checkpoint 0:34; verification starts 0:46 and is never cut.
- **Cut order if running late:** the phone demo shrinks to 1 minute (saves 1); Cowork shrinks to one sentence (saves 1–2); the skill becomes a screenshot (saves 1); the PubMed opening moves into segment 12 (saves 2); the / menu look in segment 6 becomes an instructor show (saves ~0.5).

**Segment notes**

Teaching notes for each part of the class page, in order. They used to appear on the page as collapsed Instructor tips.

*1. Welcome and sign in (0:00 – 0:03)*

**0:00 (3 min).** Put this section on screen as people arrive. Anyone without a working account pairs as navigator with someone who has one. Personal accounts are fine for the public class files only, and nobody signs up during class.

**Cut order if you run late** (verification is never cut):

1. The phone demo shrinks to 1 minute (saves 1 min).
2. Cowork shrinks to one sentence (saves 1–2).
3. The skill demo becomes a screenshot (saves 1).
4. The PubMed opening moves into segment 12 (saves 2).
5. The / menu look in segment 6 becomes an instructor show (saves ~0.5).

*1. Welcome and sign in (0:00 – 0:03) › By the end of this class, you'll be able to*

Don't read the list. Say it as one sentence: "Pick the right tool, build a Project, prompt it well, check what comes out."

Disclose your own AI use in 15 seconds: "These materials were drafted with Claude and Claude Code, and checked by me." That models the disclosure habit we cover in segment 12.

About half the class is hands-on. Point out the pattern: you watch once, then you do it yourself.

*1. Welcome and sign in (0:00 – 0:03) › No working account?*

Keep this to 20 seconds. Nobody signs up for anything during class.

*2. Trust but verify (0:03 – 0:05)*

**0:03 (2 min).** No demo; talk through the two lists. Make the trust side real: Claude is good enough to use for actual work, which is exactly why its mistakes are easy to miss. Then land the verify side: it sounds equally sure whether or not it's right, so confidence tells you nothing. Point ahead to segment 12, where everyone checks their own answer. Cut option: if you're late, read only the bold line (saves 1 min).

*3. Which Claude for which data (0:05 – 0:08)*

**0:05 (3 min):** 2 min on the decision table, 1 min on the safe habits.

*3. Which Claude for which data (0:05 – 0:08) › Standard or HIPAA-supported?*

Say plainly: "A HIPAA-supported version of Claude is available by request." Then the caveats: it doesn't approve your project, every feature, or every data set. Follow [Yale data classification / policy link]. Questions go to [HSIT / HIPAA Privacy Office contact]. Never suggest that the standard account covers PHI.

Features in the HIPAA-supported version may differ: some are off, and it keeps an older layout. Check with [ITS]. Full table and dated feature list: the [Quick reference](part1-reference.qmd#tool-data).

*4. Getting around the app (0:08 – 0:10)*

**0:08 (2 min).** Talk and point, no hands-on. Walk down the sidebar on your screen, top to bottom, then point to your name or initials and say "that's where settings live; we go there next." Don't open **Code**; it's for *Analyzing research data with Claude Code*. The HIPAA-supported version keeps an older layout, so have a screenshot of its sidebar ready and check the labels before class.

*5. Check your settings (0:10 – 0:16)*

**0:10 (6 min):** 2 min on account settings, 3 min on memory, 1 min on incognito.

*5. Check your settings (0:10 – 0:16) › Account settings: instructions for Claude*

Show **Settings > General** once on your screen, then let people fill it in. Suggest the example as a starting point. Say plainly: these go with every chat, so nothing sensitive. Point ahead: Project instructions do the same job for one Project.

*5. Check your settings (0:10 – 0:16) › Watch, then do: memory settings*

Show it once on your screen, then let people do it. Have screenshots of both layouts ready: the combined chat-and-Cowork layout, and the older layout that the HIPAA-supported version keeps.

On Enterprise accounts, memory is off for each person until they turn it on, so many people will find it already off. Skip **Import memory from other AI providers**; it isn't part of this class.

Worth one sentence: deleting a chat doesn't delete memories made from it.

*5. Check your settings (0:10 – 0:16) › Incognito: what it does and doesn't do*

**20-second poll:** "A sensitive HR email: Project, incognito, or neither?" Answer: neither. Use the tool approved for that data. Incognito doesn't make anything allowed.

Details for the page: [Quick reference: settings and privacy](part1-reference.qmd#settings).

*6. Everyday chat (0:16 – 0:19)*

**0:16 (3 min):** 30 seconds to send the prompt, 1 min on the chat box table, 1.5 min on the three switches and the "/" look. The point: a plain chat is fine for everyday tasks; a Project is for work you come back to.

*6. Everyday chat (0:16 – 0:19) › Research, web search and memory*

Before class, open **+** in a new chat in both Yale workspaces and screenshot it. Show only what's there: Research needs an Opus model enabled for the role, and the HIPAA-supported version may differ. Also type "/" and screenshot what appears (skills, connectors, styles). Styles are being folded into skills; a migrated style may show up as `/name-style`. Mention that only if someone asks.

Tie the last line back to segment 2: web search and Research give you links, which makes checking easier, but a link isn't proof until you open it.

*7. Models, effort and skills (0:19 – 0:24)*

**0:19 (5 min):** talk and show, no hands-on. 2 min on the model menu, 2 min on skills, 1 min for questions. Open each on your screen; participants just watch.

*7. Models, effort and skills (0:19 – 0:24) › Models and effort*

Open the menu on screen. Current models (check the menu before class): Fable 5.1, Opus 5.5, Sonnet 5.5, Haiku 5.5, with older ones under "More models." Effort levels: Low, Medium, High, Extra high, Max; each model marks its recommended level "Default."

Fable may need usage credits on a standard seat [confirm Yale seat tiers]. More: [Quick reference: model, effort and commands](part1-reference.qmd#model-effort-commands).

*7. Models, effort and skills (0:19 – 0:24) › Skills*

Open **Customize > Skills** on the demo account, then type "/" in a chat to show the same skills there. If you want a live example, ask for a one-page Word handout of anything on screen; skip it if skills or file creation are off and show the screenshot instead.

*8. Watch: build a Project (0:24 – 0:26) › Five steps*

**0:24 (2 min).** Do it once at normal speed on the demo account. Point out the **Share** button (Can view / Can edit, if enabled), but don't stop on it.

"Use account memory" keeps this Project's memory separate from the rest of your chats. Check the label before class.

*9. Your turn: build your Project (0:26 – 0:35)*

**0:26 (9 min):** 8 min build, 1 min checkpoint. At 0:34, ask who still needs help. Move on at 0:35 regardless; anyone still building catches up during Turn 1.

*9. Your turn: build your Project (0:26 – 0:35) › Your turn: build it*

Walk the room. Most common problems: the file landed in a regular chat instead of the Project, or the instructions weren't saved.

If an upload fails: paste the style guide's text at the end of the project instructions, and paste the article (Kit A) or committee pack (Kit B) into the first message of the Project chat. Or open the instructor's shared Project (Can view, if sharing is enabled). Check before class whether the Project has an "add text" option.

Windows users who get `.md.txt` files: the fix is on the setup page.

*9. Your turn: build your Project (0:26 – 0:35) › Your kit*

Say out loud: the privacy line in the Project instructions is advice, not enforcement. Claude will usually follow it, but nothing stops a paste. Part 2 shows tools that actually block things.

*10. Watch: anatomy of a strong prompt (0:35 – 0:37) › What each part does*

**0:35 (2 min).** Show the pre-run Turn 1 chat (a live ask-first round trip won't fit in 2 minutes). Point to Claude's questions, then to the "Where this came from" table: it turns checking into a 2-minute Ctrl-F job.

All six prompting patterns, with examples: [Quick reference: prompt library](part1-reference.qmd#prompt-library).

*11. Your turn: run it, then push back (0:37 – 0:46)*

**0:37 (9 min):** 8 min hands-on, 1 min pair debrief. Default model and effort avoid usage limits.

*11. Your turn: run it, then push back (0:37 – 0:46) › Your turn: Turn 1*

Anyone stuck on Claude's questions can use the fast answers on the class page. Walk the room. If someone's Claude skips the questions, that's a teaching moment: point to the "Wait" line and have them reply "Please ask your questions first."

*11. Your turn: run it, then push back (0:37 – 0:46) › Your turn: push back (Turn 2)*

**0:45 (1 min).** Pair debrief, then take one answer from the room. Key message: treat the first answer as a draft; much of the value comes from the second turn.

*12. Verify before you use it (0:46 – 0:55)*

**0:46 (9 min). Don't cut this segment.** 1 min demo, 6 min hands-on, 2 min talk.

*12. Verify before you use it (0:46 – 0:55) › Your turn: check quotes and rules*

Demo one quote check on your screen first (1 min), then let people go.

The bonus: the abstract says 98 people enrolled in the telehealth arm, then reports week-24 blood pressure for "96/99 intervention." Ask: "Did anyone's Claude repeat 99 without noticing that 98 were enrolled? Did anyone's Claude flag it?" Either answer is a good discussion.

The article has two more inconsistencies: the week-48 confidence interval (abstract: 95% CI [30%, 53%]; Results: [14%, 38%], which repeats the week-24 interval) and the share of women (abstract 67%, Results 70%, 139/200). A quote can be "exact" and still be wrong. If someone's explainer cites the week-48 CI, ask which section it came from.

*12. Verify before you use it (0:46 – 0:55) › Your turn: check a citation (Turn 3)*

If web search is on, Claude may return real studies. Frame it as: "Declining or labeling is the behavior you want, and you still check." If nobody finds a bad reference, the habit is still the lesson: you checked before you used it.

*12. Verify before you use it (0:46 – 0:55) › Your turn: add one rule*

**0:52.** This is the second Create moment: their Project now has their own verification rule in it.

*12. Verify before you use it (0:46 – 0:55) › You're accountable for what you use*

**0:53 (2 min).** Talk only. If anything went wrong in the room today, use it as the example.

Disclosure template, notice dates, and red flags for fabrication and bias: [Quick reference: verify and disclose](part1-reference.qmd#verify-disclose). Library evidence synthesis service: [link].

*13. Take it with you: the phone app (0:55 – 0:57)*

**0:55 (2 min):** demo only; people try it on their own phone after class. Cut option: make this a 1-minute demo (saves 1 min).

*13. Take it with you: the phone app (0:55 – 0:57) › Watch, then try: your Project on your phone*

Mirror the phone (iPhone Mirroring or QuickTime). Use the dictation mic for the question. Point out voice mode (beta, the sound-wave icon next to the mic) without running it. Check before class that Projects appear in the phone app for both workspaces.

*13. Take it with you: the phone app (0:55 – 0:57) › Phone rules*

Bridge sentence: "This app has a Code tab. In Part 2, /rc connects it to a Claude Code session on your laptop (if your organization has turned on Remote Control)."

*14. Cowork and the bridge to Claude Code (0:57 – 0:59)*

**0:57 (2 min). Talk only.** Cut option: say Cowork in one sentence (saves 1–2 min).

*14. Cowork and the bridge to Claude Code (0:57 – 0:59) › Cowork in 30 seconds*

Don't demo. Claude in Chrome (if enabled) is Cowork in your browser: same cautions. More: [Quick reference: Cowork](part1-reference.qmd#cowork).

*14. Cowork and the bridge to Claude Code (0:57 – 0:59) › From today to Claude Code*

One sentence: "Everything you did today has a twin in Part 2, but there it works on files and code on your own computer." Part 1 is recommended, not required, for Part 2.

*Where to go next (0:59 – 1:00)*

**0:59 (1 min).** Close: show this section and the feedback link, take a question or two, and end on time. Leave it on screen while people pack up.

**Kit A answer key (Article Explainer)**

Article: Hickey MD et al., *PLoS Med* 2025;22(6):e1004632, PMID 40472026, PMC12165344. Main result to check against: week-24 hypertension control 77% (telehealth) vs 51% (clinic), risk difference 26%, 95% CI 14% to 38%.

| Expected catch | What a good answer does |
|---|---|
| **98 vs 99.** The abstract says 98 were enrolled in the telehealth arm, then that week-24 BP was measured in "96/99 intervention" participants. | Flags the inconsistency (the instructions say to say so) instead of repeating "99" silently. The full text doesn't explain it. |
| **Week-48 CI and % women.** The abstract gives the week-48 risk difference as 42%, 95% CI [30%, 53%]; Results repeat the week-24 interval, [14%, 38%]. The abstract says 67% women; Results say 70% (139/200). | Quotes the section it used. A quote can be "exact" and still wrong, so ask which section a number came from. |
| **Moderate-severe vs severe.** The title says "moderate-severe hypertension"; eligibility was BP ≥ 160/100 mmHg, which the abstract calls "severe." | Describes who was studied using the eligibility criteria, with the quote. |
| **Small sample size / pilot → "early evidence."** The authors call it a pilot and name small sample size as the limitation. | Uses "early evidence," not "proves" or "breakthrough." Turn 2 flags any overstatement or causal language. |
| **Generalizability.** Adults 40 and older at three rural primary health centers in Kenya and Uganda; 67% women (abstract) or 70% (Results); 14% with HIV. | Turn 2 names who the results might not apply to (for example, other health systems, younger adults, or milder hypertension). |

Rule check: plain-language version 150 words or fewer; patient-facing versions end with "Talk with your care team"; no "breakthrough," "proves," "cure," "always," "never"; numbers also in words for patients. Turn 3: a refusal, or references marked UNVERIFIED, counts as good behavior; any PMID that doesn't match in PubMed is the teaching point.

**Kit B answer key (Committee Assistant)**

Check these against the final `materials/part1-kits/kit-b/committee-pack-synthetic.md`.

| Expected catch | What a good answer does |
|---|---|
| **The student appeal is left out.** The notes mention "a student appeal (details confidential)." | It isn't in the summary email or the action items, and it shows up under item 4 ("should NOT go into a wider email") with the reason. |
| **No-owner item.** The survey follow-up has no owner or due date. | The owner and due date say NOT IN NOTES. Nothing is invented. |
| **Ambiguous decision.** One decision is written so it could be read two ways. | Flags it as unclear (or asks), rather than silently picking one reading. |
| **3-business-day rule.** The charter says action items go out within 3 business days. | Applies the rule (for example, a send-by date or a note in the email). |

Also check: roles only, no names; email under 200 words; the agenda fits 60 minutes and ties each item to a charter duty; two action items trace to exact note lines.

**Backup plans**

| Problem | Fallback |
|---|---|
| A participant has no working account | Pair them as navigator with a neighbor. No sign-ups during class; personal accounts are for the public class files only. |
| Uploads fail | Paste the file text into the Project instructions, or open the instructor's shared Project (Can view, if enabled). |
| Claude outage or Wi-Fi down | Teach from your screen and the backup screenshots. Participants build their Project after class from `part1.html`. |
| A setting or menu is missing for some people | Say it depends on the workspace or admin settings, show it on your screen, and move on. |
| Phone mirroring fails | Show the phone screenshots and say it in one sentence; use the cut order. |
| Skills or file creation are off | Show the Word handout screenshot and Customize > Skills on your screen. |
| Windows downloads the kit files as `.md.txt` | Point to the troubleshooting note on the setup page; the files still upload. |

**If Part 1 grows to 90 minutes**

Add these back in order, up to 30 minutes in total. Update the segment notes and timings here, and the duration in `part1-description.md`.

1. A participant skill hands-on: the Word handout, or uploading a custom skill (if skills, code execution and file creation are enabled).
2. A longer phone segment: everyone opens their Project on the phone app and tries dictation.
3. The Research or PubMed connector demo (if enabled).

## Part 2: instructor prep

Claude Code changes almost weekly. This page was checked against code.claude.com/docs in **October 2026** (Claude Code v2.1.28x). The week before class, update the extension and re-check the items marked **check before class**, especially in Positron, which installs the extension from Open VSX and isn't the editor the docs describe. Items marked **(if enabled)** depend on enterprise admin settings. Replace every `[bracketed placeholder]`.

**Instructor files (repo only):** this file (dataset spec, planted problems, answer key), `instructor/solutions/R/` and `instructor/solutions/python/` (finished scripts and report: your fallback), and `instructor/part2-answer-key/` (the finished `.claude/` folder, tests, and `CLAUDE.md` additions; R only).

**Prep checklist**

- [ ] Send participants this page and the [setup steps](https://cwml.github.io/getting-started-with-claude/index.html#setup-part2) 3–5 days ahead.
- [ ] Update the Claude Code extension in Positron. Note the version shown by `/status` in the panel.
- [ ] **Build the demo project with git tags** so you can reset, or jump ahead if a demo stalls. Run from anywhere, adjusting the two paths:
  ```bash
  DEMO=~/Documents/hypertension-cohort        # unzipped participant zip
  REPO=~/Documents/GitHub/claude-code         # this repo
  cd "$DEMO"
  printf '.claude/settings.local.json\n.claude/worktrees/\nCLAUDE.local.md\n.Rhistory\n' > .gitignore
  git init && git add -A && git commit -m "Starting point" && git tag part2-start
  cp "$REPO"/instructor/solutions/R/*.R R/
  cp "$REPO"/instructor/solutions/R/report.qmd reports/
  cp -R "$REPO"/instructor/part2-answer-key/.claude "$REPO"/instructor/part2-answer-key/tests .
  chmod +x .claude/hooks/*.sh
  for s in R/0*.R; do Rscript "$s"; done && quarto render reports/report.qmd
  Rscript tests/run_checks.R
  git add -A && git commit -m "Part 2 complete" && git tag part2-complete
  git reset --hard part2-start && git clean -fd
  ```
  "Pull in" below means `git checkout part2-complete -- <path>`. Paste `CLAUDE-additions.md` into `CLAUDE.md` on the complete tag if you want to show the `@docs/SAP.md` import.
- [ ] In the panel, set the mode indicator to **Manual**. The extension ignores a project's `permissions.defaultMode`, so to pin it, set `claudeCode.initialPermissionMode` to `manual` in Positron's *user* settings.
- [ ] **Check before class (Positron):** the Spark icon and the status-bar entry; which commands appear when you type `/`; that `/plan`, `/compact`, `/status`, `/usage`, `/sandbox`, `/rc`, and `/btw` work; the model picker's **Effort** row and **Ultracode** switch; the hover **rewind** button; side-by-side diffs; `Option/Alt+K` @-mentions; and the `/` menu's **Customize** entries (Permissions, Hooks, Memory, Instructions).
- [ ] **Check before class (admin):** Which workspace are participants in: the standard enterprise one or the HIPAA-supported one (where Remote Control is off)? Is auto mode available? Are dynamic workflows (ultracode, `/deep-research`), fast mode, and Remote Control turned on for your org? Do claude.ai skills sync into Claude Code? Which connectors appear in `/mcp`? Does your role have an effort cap? `[Record results here]`
- [ ] Install `jq`, `styler`, and `lintr` on the demo laptop. The answer-key `settings.json` registers both hooks and turns the sandbox on, so pre-install all R packages.
- [ ] Rehearse Exercise 1 end to end on the start tag, and compare your numbers with the answer key in `instructor/README.md` (n = 451; −11.01 mmHg, 95% CI −12.80 to −9.22). Keep `instructor/solutions/R/` open in a second Positron window as the fallback.
- [ ] Record backup screenshots or video of each demo. Enlarge Positron's zoom and the panel font. Check the [slides](https://cwml.github.io/getting-started-with-claude/part2-slides.html)' speaker notes (press **S**).

**Run of show.** Two windows: the slides (presenter view) and Positron with the demo project on `part2-start`, the Claude panel docked on the right.

| Time | On screen | Instructor does |
|---|---|---|
| −0:15 | Slides: title | Demo reset (below). Open the panel, check `/status`, enlarge fonts. |
| 0:00 | Slides → Positron | **1** Welcome. Everyone opens the project and the panel. |
| 0:05 | Slides → Positron | **2a** data rules · **2b** `CLAUDE.md` and memory · **2c** Manual mode, deny rule, git |
| 0:17 | Positron | **3a** plan mode on the SAP · **3b** `R/01_clean.R` · **3c** Data Explorer check |
| 0:33 | Positron | **3d** Table 1, model, report · **3e** rewind and commit. Circulate. |
| 0:42 | Slides: break | Help people who are behind. Pull in `R/` from `part2-complete` on your screen if needed. |
| 0:47 | Slides → Positron | **4a** context · **4b** model and effort · **4c** ultracode · **4d** `/rc` |
| 0:57 | Slides → Positron | **5a** talk · **5b** pull in two skills, agent, hook · **5c** Exercise 2 |
| 1:12 | Positron | **6** REDCap and legacy code (cut first if late) |
| 1:20 | Positron → slides | **7** tests, reviewer, "why cleaning matters," discussion |
| 1:27 | Slides: takeaways | **8** Try at home, feedback link, Q&A until 1:30. Then run the demo reset. |

**Demo reset** (before class and after each run):

```bash
cd ~/Documents/hypertension-cohort
git reset --hard part2-start && git clean -fd
rm -f .claude/settings.local.json            # local approvals
rm -rf ~/.claude/skills/redcap-clean         # if you built it in a demo
```

Then, in the panel: run `/rc` to disconnect Remote Control if it's on, turn ultracode off, clear rehearsal notes in **Customize → Memory**, and archive old sessions in Session history.

**Segment notes**

Teaching notes for each part of the Part 2 class page, in order. They used to appear on the page as collapsed Instructor notes boxes.

*1. Welcome and setup check (0:00 – 0:05)*

Give everyone 2 minutes. Managed settings can override the demo; if so, show `/status` and the Permissions dialog as a lesson in enforcement. If the extension won't install or sign in in Positron, try **Developer: Reload Window**, then fall back to VS Code or to `claude` in the Terminal (if they installed the CLI). No Claude Code seat: pair with a neighbor. The panel and the CLI share settings, `CLAUDE.md`, and conversation history (`claude --resume` in the terminal picks up a panel conversation).

*2. Data rules and project setup (0:05 – 0:17)*

Read the local policy aloud once the placeholder is filled in: `[Insert local policy]`. Don't say the standard enterprise account covers PHI or any data classification. The HIPAA-supported version exists by request, but it doesn't approve any project, and the extension panel used today isn't covered by Anthropic's HIPAA agreement (code.claude.com/docs, HIPAA setup page; **check before class** and confirm with ITS). Ask: "Think of one dataset you work with. Which pattern would you need?" Take one answer.

*2. Data rules and project setup (0:05 – 0:17)*

About 4 minutes for 2c. Participants do steps 1–4. If Customize → Permissions isn't in Positron's panel (**check before class**), have everyone use the JSON file. If time allows, demo the gap (1 minute): "Write an R script that prints the first 3 rows of data/restricted/visit_notes.csv, then run it." Approve it once to show it works, then turn on `/sandbox` and retry; it should fail. Don't let participants keep this script. Transition: "Now the project is set up the way you'd set up a real one. Let's use it."

*3. Plan, build, verify (0:17 – 0:42)*

Narrate the write → run → error → fix loop the first time it happens; it's the core value. During 3a, ask the room how many problems Claude found (six were planted; see `instructor/README.md`). At 3c, demo the Data Explorer check on your screen. At 0:39, move to 3e even if people are still in 3d. If the live demo stalls, run `git checkout part2-complete -- R reports output` and walk through the finished files. **Check before class:** that Positron's panel opens the plan as a commentable document, the exact wording of the plan-approval options (which one keeps manual approval), and that the hover rewind button shows all three options.

*4. Working well (0:47 – 0:57)*

Ten minutes, mostly talk with short demos. **4a:** point at the context indicator, run `/compact` with a focus. **4b:** open the model picker and show the Effort row; switch to `opusplan` and enter plan mode. Run the `ultrathink` prompt (it's a good lead-in to Segment 7). **4c:** show the Ultracode switch; run the `ultracode` prompt only if workflows are enabled and you have usage headroom, otherwise show the slide. Don't run `/deep-research` live unless rehearsed; it takes minutes. **4d:** start a deliberately slow task (such as rendering the report), run `/rc`, open the session on your mirrored phone (iPhone Mirroring or QuickTime, tested on the room projector), and approve a permission prompt from it. From the phone you can also send `/model sonnet` or `/effort high`. **Check before class (Positron):** that typed `/model` and `/effort` work in the panel or only the picker does, that the Ultracode switch appears (v2.1.284+, workflows enabled), that the `ultracode` keyword highlights, how a workflow's progress shows in the panel (the `/workflows` view is documented for the CLI), and that `/rc` and the Remote Control indicator work in your workspace (it's off in the HIPAA configuration).

*5. Extending Claude Code (0:57 – 1:12)*

Pull in one piece at a time: `git checkout part2-complete -- .claude/skills/check-data`, then `.claude/skills/table1`, then `.claude/agents`, then `.claude/settings.json .claude/hooks`. Start a new conversation after each pull-in so the new files load (or try `/reload-skills`, which is needed when the `skills/` folder didn't exist when the session started; **check before class** in the panel). Open each file and point out the frontmatter: `description`, `disable-model-invocation`, `argument-hint`, `allowed-tools`, `tools`. If someone asks how the reviewer was made: ask Claude to create a subagent, or write the file in `.claude/agents/`; don't demo `/agents`, which no longer opens a menu. A reviewer told to find problems will usually find some. It's told to report only validity and SAP issues, and *you* still decide. The hook needs `jq`; show it under `/` → **Customize → Hooks**. The answer key also has an `Edit(./data/raw/**)` deny rule, so point to the hook's own message ("Write derived data to output/ instead") as proof that the hook blocked the edit. If you see a plain permission-denied message instead, the deny rule caught it; remove that rule from the demo copy and retry. The answer-key `settings.json` also registers a styler/lintr hook and turns the sandbox on, so mention both without demoing them. If a demo stalls, show the file and move on.

*5. Extending Claude Code (0:57 – 1:12)*

Circulate. Common problems: the `.claude` folder created inside `R/` or `data/`; a file saved as `SKILL.md.txt`, or put directly in `.claude/skills/` instead of its own `check-data/` folder; a misspelled frontmatter field (Claude Code silently ignores fields it doesn't recognize); or a skill that doesn't appear until a new conversation starts or `/reload-skills` runs. Positron's Explorer may hide dot-folders, depending on its `files.exclude` setting (**check before class**). If it does, have participants ask Claude to create the file with the exact text. At 1:09, call time for "make it yours," even if some people are still testing. Spend the last minute on the debrief: what did people change to make it theirs, and who got automatic loading to work?

*6. Messy real-world sources (1:12 – 1:20)*

Pick one of 6a or 6b; do both only if you're early. Answer keys are in `instructor/README.md` under "Part 2 extras." **REDCap:** site A uses `record_id` and visit-named BP columns (`sbp_baseline` … `sbp_12m`); site B codes arm `1`/`2` and sex `1`/`2`, and exports blank labs as `-99`; site C uses `MM/DD/YYYY` dates, `smoking_status`, and an extra `redcap_data_access_group` column. **SAS bugs:** only `-99` is recoded, and only for `sbp_v0` and `ldl_mgdl`; the sex recode misses `f` and `2`; `if age < 65` puts missing age in `<65`; `nodupkey` drops duplicates silently. **Stata bugs:** `drop if missing(sbp_v3)` runs before Table 1; BP columns with `NA` import as strings, so the `-99` recode fails, and `999` is never recoded; `duplicates drop ..., force` keeps an arbitrary row. Score how many bugs Claude found.

*7. Verification and research integrity (1:20 – 1:27)*

Run the test-first prompt live (3 min). If it stalls, run `git checkout part2-complete -- tests`, then ask Claude to run `Rscript tests/run_checks.R`. Show the "why cleaning matters" numbers on the slide; to make them live, ask: "Fit the SAP's primary model to data/raw/class_cohort.csv without any cleaning and put the result next to the cleaned result. Don't save anything." Tie each point to something that happened in class, such as the Data Explorer check or a mistake Claude made.

**Backup plans**

| Problem | Fallback |
|---|---|
| Wi-Fi or Claude outage | Play the recorded demos; walk through `instructor/solutions/R/` and the answer key on screen |
| Extension won't install or sign in, or a panel feature is missing | Reload the window; try VS Code; or run `claude` in the Terminal if the CLI is installed |
| No Claude Code seat | Pair with a neighbor; the `.claude/` files are plain text anyone can write |
| Live Exercise 1 goes off track | `git checkout part2-complete -- R reports output` and walk through the finished files |
| Claude's numbers differ from the answer key | Compare the n's at each step; it's a verification teaching moment, not a failure |
| Workflows, fast mode, or Remote Control not enabled | Show the slide and the docs; skip the live demo |
| Running long | Cut Segment 6, then shorten 4c–4d to the slide, then shorten Exercise 2 to Option A. **Keep Segment 7 intact.** |

## Dataset spec

This is the single source of truth for the class dataset. The data dictionary, SAP, class pages, slides, and solutions must all use these names.

**Fictional study:** a two-arm randomized trial of *intensive* vs. *standard* blood-pressure control in adults with hypertension, run at 3 sites. It has a baseline visit and follow-up visits at 3, 6, and 12 months. **Every value is synthetic.** No real patients are involved.

### Files (participants see these)

| File | Location in starter project |
|---|---|
| `class_cohort.csv` | `data/raw/class_cohort.csv` (~505 rows: 500 patients + 5 duplicate rows) |
| `data_dictionary.csv` | `data/data_dictionary.csv` (columns: `variable, label, type, units, allowed_values, missing_codes, notes`) |
| `SAP.md` | `docs/SAP.md` (one-page statistical analysis plan) |

### Variables (wide format, one row per patient)

| Variable | Type | Clean values |
|---|---|---|
| `patient_id` | id | `HTN-0001` … `HTN-0500` |
| `site` | categorical | `A`, `B`, `C` |
| `enroll_date` | date | 2022-01-01 to 2023-06-30, ISO `YYYY-MM-DD` |
| `arm` | categorical | `Intensive`, `Standard` (about 1:1) |
| `age` | integer, years | 40–85 |
| `sex` | categorical | `F`, `M` |
| `race_ethnicity` | categorical | `Asian`, `Black`, `Hispanic`, `White`, `Other/Unknown` |
| `bmi` | numeric, kg/m² | 18–50 |
| `smoking` | categorical | `Never`, `Former`, `Current` |
| `diabetes` | binary | 0/1 |
| `ckd` | binary | 0/1 |
| `ldl_mgdl` | numeric, mg/dL | 50–220 |
| `egfr` | numeric, mL/min/1.73m² | 15–120 |
| `n_bp_meds_v0` | integer | 0–4 |
| `sbp_v0` … `sbp_v3` | numeric, mmHg | systolic BP at baseline, 3, 6, and 12 months (plausible range 80–220) |
| `dbp_v0` … `dbp_v3` | numeric, mmHg | diastolic BP, same visits (40–130) |
| `adverse_event` | binary | 0/1, any serious adverse event by 12 months |
| `cuff_size` | categorical | `S`/`M`/`L`. **Not in the data dictionary** (planted problem) |

**Built-in signal:** baseline SBP averages about 150. By 12 months, SBP falls by about 20 mmHg in the Intensive arm and about 10 mmHg in the Standard arm, with realistic noise. Loss to follow-up is about 8–10% by v3 and is somewhat higher in older patients (missing at random given covariates, which makes a good discussion point). The Intensive arm has slightly more adverse events.

### Planted data quality problems

1. Implausible values: one `sbp_v1 = 1200`, one `age = 207`, one `bmi = 4.2`
2. Inconsistent sex coding: mostly `F`/`M`, plus some `Female`, `Male`, `1`, `2`, `f`
3. Sentinel missing codes: `-99` and `999` in some BP and lab fields, alongside blanks and `NA`
4. 5 duplicate `patient_id` rows (exact duplicates of existing patients)
5. Mixed date formats in `enroll_date`: mostly ISO, plus some `MM/DD/YYYY` and `DD-Mon-YY`
6. `cuff_size` is in the data but not in the dictionary

### SAP essentials (primary analysis)

- **Primary outcome:** change in SBP from baseline to 12 months (`sbp_v3 − sbp_v0`).
- **Primary model:** ANCOVA (linear regression) of the change on `arm`, adjusted for baseline `sbp_v0` and `site`. Report the adjusted mean difference (Intensive − Standard) with its 95% CI.
- **Population:** randomized patients with non-missing `sbp_v0` and `sbp_v3` after cleaning (complete case). Sensitivity analyses (multiple imputation, a mixed model using all visits) are listed as *planned*, and are good demo prompts.
- **Table 1:** baseline characteristics by arm.
- **Figure:** mean SBP (±95% CI) by visit and arm.

## Answer key and solutions (Part 2 build segment)

These scripts show what a successful Claude Code demo should produce for the hypertension cohort project. Use them as an **answer key** and as a **fallback if the live demo fails**. All data are synthetic.

There are two matching versions. They give identical cleaned data, Table 1, cleaning log, and model results.

| R (`R/`) | Python (`python/`) | What it does | Writes to `output/` |
|---|---|---|---|
| `01_clean.R` | `01_clean.py` | Fixes every planted problem and logs each change | `cohort_clean.csv`, `cleaning_log.csv` |
| `02_table1.R` | `02_table1.py` | Table 1 by arm: mean (SD), n (%), missing counts | `table1.html`, `table1.csv` |
| `03_primary_model.R` | `03_primary_model.py` | ANCOVA from the SAP | `primary_model.csv`, `analysis_population.csv` |
| `04_figure.R` | `04_figure.py` | Mean SBP (95% CI) by visit and arm | `fig_sbp_by_visit.png`, `sbp_by_visit.csv` |
| `report.qmd` | `report.qmd` | Quarto HTML report that reads the outputs above | `reports/report.html` |

R uses tidyverse, here, gtsummary, gt, and broom. Python uses pandas, numpy, statsmodels, and matplotlib (plus Jupyter to render the report).

### Key results (answer key)

| | R | Python |
|---|---|---|
| Rows in raw file | 505 | 505 |
| Patients after removing duplicates | 500 (250 per arm) | 500 (250 per arm) |
| Missing baseline SBP (`sbp_v0`) | 2 (1 per arm) | 2 |
| Missing 12-month SBP (`sbp_v3`), with baseline | 47 (Standard 27, Intensive 20) | 47 |
| **n analyzed (complete case)** | **451** (Standard 222, Intensive 229) | **451** |
| Mean unadjusted change | Standard −9.6, Intensive −20.5 mmHg | same |
| **Adjusted difference, Intensive − Standard** | **−11.01 mmHg** | **−11.01 mmHg** |
| **95% CI** | **−12.80 to −9.22** | **−12.80 to −9.22** |
| p-value | 3.1 × 10⁻²⁹ | 3.1 × 10⁻²⁹ |
| Baseline SBP coefficient | −0.27 (−0.34 to −0.19) | same |

The model is `sbp_change ~ arm + sbp_v0 + site`, with Standard as the reference arm.

**Why cleaning matters (a good slide):** if you fit the same model to the *raw* file without cleaning (so -99 and 999 are treated as real BP values and duplicates are kept), you get n = 462 and a difference of −8.4 mmHg (95% CI −19.6 to 2.9). That result is not significant. A few sentinel codes are enough to hide a 10 mmHg treatment effect.

Other things participants may notice:

- Patients missing 12-month SBP are older (mean age 66.5 vs. 62.4). The generator made loss to follow-up depend on age, so data are missing at random given covariates, not completely at random. This is a good lead-in to the planned multiple imputation and mixed model sensitivity analyses.
- Serious adverse events: Intensive 9.6%, Standard 6.0%.
- The generator's "true" effect is about −10 mmHg (−20 vs. −10). The estimate of −11 is within normal sampling noise.

### Planted problems and how each was fixed

| # | Planted problem | Where in the raw file | Fix in `01_clean` |
|---|---|---|---|
| 1 | Implausible values | `sbp_v1 = 1200` (HTN-0156), `age = 207` (HTN-0295), `bmi = 4.2` (HTN-0264) | Values outside the dictionary's allowed range set to missing. We don't guess the intended value. |
| 2 | Inconsistent sex coding | `Female` (7), `Male` (11), `f` (4), `1` (7), `2` (5). The numeric codes are all from site C. | Recoded to `F`/`M`. **Assumption:** `1` = M and `2` = F (the generator used this coding, as NHANES does). In class, this is a "ask the data manager" moment. |
| 3 | Sentinel missing codes | `-99`/`999` in `sbp_v0` (2), `sbp_v2` (2), `sbp_v3` (5), `dbp_v1` (2), `dbp_v3` (2), `ldl_mgdl` (5), `egfr` (3). True blanks and the text `NA` also appear. | `-99` and `999` set to missing. Blanks and `NA` are read as missing. |
| 4 | Duplicate rows | 5 exact duplicates: HTN-0257, HTN-0263, HTN-0322, HTN-0389, HTN-0394 (each right after its original) | Exact duplicate rows removed, then checked that every `patient_id` is unique. |
| 5 | Mixed date formats | `enroll_date`: 465 ISO, 25 `MM/DD/YYYY`, 15 `DD-Mon-YY` | Each format detected with a pattern and parsed with its own rule. The script stops if any date fails to parse. |
| 6 | Undocumented column | `cuff_size` (`S`/`M`/`L`) is not in the data dictionary | Kept but not used. Logged as a question for the data manager. |

Every fix appears in `output/cleaning_log.csv`, with the affected patient IDs.

### How to run them

Always run the solutions in a **copy** of the starter project, never inside `materials/`. The scripts only read `data/raw/` and write to `output/` and `reports/`, but keeping the repo's starter folder clean means the participant zip stays clean too.

**R:**

1. Copy `materials/hypertension-cohort/` somewhere outside this repo, such as your Desktop.
2. Copy `instructor/solutions/R/*.R` into its `R/` folder, and `instructor/solutions/R/report.qmd` into its `reports/` folder.
3. From the project folder, run:
   ```
   Rscript R/01_clean.R
   Rscript R/02_table1.R
   Rscript R/03_primary_model.R
   Rscript R/04_figure.R
   quarto render reports/report.qmd
   ```
   Or open the folder in Positron and source each script in order.

**Python:**

1. Make a second copy of `materials/hypertension-cohort/`. Delete `CLAUDE.md`, rename `CLAUDE.python.md` to `CLAUDE.md`, and create a `python/` folder.
2. Copy `instructor/solutions/python/*.py` into `python/`, and `instructor/solutions/python/report.qmd` into `reports/`.
3. From the project folder, run `python python/01_clean.py`, then `02`, `03`, `04`, then `quarto render reports/report.qmd`. If Quarto picks up the wrong Python, set `QUARTO_PYTHON` to the Python that has pandas, statsmodels, and Jupyter.

The scripts use `here::i_am()` (R) and paths relative to the script (Python), so they find the project root when run from the project folder or any folder inside it.

### Using the solutions as a demo fallback

Prepare this before class:

- [ ] Run the R solutions in a copy of the project (steps above), and keep that folder ready. Optionally, also make it a git repo with one commit per script, so you can show the history.
- [ ] Open `reports/report.html` and `output/fig_sbp_by_visit.png` once to check that they look right.

If the live demo fails (an outage, a sign-in problem, or Claude going down a bad path):

1. Say so plainly: "Here's what this session produced when I ran it earlier."
2. Open the prepared folder in Positron. Walk through `01_clean.R` and the cleaning log, and point out each planted problem as it's fixed.
3. Open `cohort_clean.csv` in the Data Explorer to show that SBP = 1200, `-99`, and the duplicate IDs are gone.
4. Show the rendered report and the key result: −11.0 mmHg (95% CI −12.8 to −9.2), n = 451.
5. Use the "why cleaning matters" numbers above to make the verification point in the verification segment.

If Claude's live output differs from these results, that's a teaching moment, not a failure. Compare the n's first, because most differences come from cleaning choices (for example, how the `1`/`2` sex codes or the implausible values were handled). Only choices that affect `sbp_v0`, `sbp_v3`, `arm`, `site`, or duplicates change the primary result.

## Extra project files (REDCap, restricted, legacy)

Besides the class cohort, the practice project (`materials/hypertension-cohort/`) holds files for the later Part 2 segments:

| Path | What it is | How it's made |
|---|---|---|
| `data/raw/redcap/redcap_export_site_{A,B,C}.csv` | Per-site "REDCap exports" to harmonize | `instructor/make_data.R` (splits `class_cohort.csv` by site) |
| `data/restricted/visit_notes.csv` | Fictional stand-in for a folder Claude must never read | Written by hand |
| `legacy/baseline_table.sas`, `legacy/baseline_table.do` | "Inherited" code to explain or translate | Written by hand |

The zip has no solution scripts or cleaned data, because participants produce those in class. If you regenerate `class_cohort.csv`, rerun `make_data.R` so the REDCap exports match.

**How the REDCap exports differ** (the harmonization answer key):
- **Site A:** `patient_id` is renamed `record_id`, and the BP columns are named by visit (`sbp_baseline`, `sbp_3m`, `sbp_6m`, `sbp_12m`, and the same for `dbp_`).
- **Site B:** `arm` is coded `1` = Intensive and `2` = Standard. `sex` is coded `1` = M and `2` = F. Blank `ldl_mgdl`/`egfr` values are exported as `-99`.
- **Site C:** `enroll_date` is all `MM/DD/YYYY`, `smoking` is renamed `smoking_status`, and there's an extra `redcap_data_access_group` column.
- Every site keeps the planted cleaning problems (duplicates, 1200 SBP, `-99`/`999` codes, `cuff_size`).

**Planted bugs in the legacy code** (the "explain this and list anything that looks like a bug" answer key):

`baseline_table.sas`
- Only `-99` is recoded, and only for `sbp_v0` and `ldl_mgdl`. The `999` codes, and the `-99` codes in `dbp_v0` and `egfr`, flow into the means.
- The sex recode misses `f` and `2`.
- `if age < 65` puts **missing** age in `<65`, because SAS treats missing as smaller than any number. Age 207 lands in `65+`.
- `proc sort nodupkey` drops the duplicates silently, with no log of what was removed.

`baseline_table.do`
- `drop if missing(sbp_v3)` runs *before* Table 1, so the "baseline" table only includes completers.
- `import delimited` reads BP columns that contain `NA` as strings, so `replace … == -99` fails with a type mismatch. The `999` codes are never recoded either.
- `duplicates drop patient_id, force` keeps an arbitrary row when duplicates differ.

## Real public datasets to consider

The synthetic cohort stays for now: the planted problems are what make the cleaning exercise work. These real, public, de-identified datasets could replace or supplement it later. **Before you use any of them, check the terms of use about sending data to external AI services.**

| Dataset | Why it fits | Watch out for |
|---|---|---|
| **NHANES** (CDC) | Best fit. Real exam blood pressure, a hypertension questionnaire, and demographics, all public domain. It's messy in realistic ways: files merge on `SEQN`, refused/don't-know codes (7/9, 77/99), and several readings per person. | Survey weights: unweighted results aren't nationally representative. That's a good "question the statistics" moment. |
| **`medicaldata` R package** | Real de-identified teaching datasets from published studies, e.g. `indo_rct` (an RCT) and `strep_tb` (the 1948 MRC streptomycin trial) | Small and already fairly clean |
| **Vanderbilt Biostatistics datasets** (hbiostat.org/data) | Real clinical datasets with documentation, e.g. SUPPORT and RHC | Read each dataset's notes |
| **CDC PLACES / County Health Rankings** | County-level hypertension prevalence | Aggregate only |
| **BRFSS** (CDC) | Large self-reported survey that includes hypertension | Survey weights; large files |
| **Avoid** | SPRINT and Framingham (via NHLBI's BioLINCC repository), MIMIC, dbGaP, UK Biobank | Data use agreements typically restrict use with external AI services |

## Regenerating the data

The class dataset is made by `instructor/make_data.R`, following the spec above. The script uses a fixed seed, so it writes the same files every time: `class_cohort.csv` and the Part 2 REDCap exports.

To regenerate it, run this from the repo root (needs R and the tidyverse):

```
Rscript instructor/make_data.R
```

This overwrites `materials/hypertension-cohort/data/raw/class_cohort.csv` and `materials/hypertension-cohort/data/raw/redcap/`. The data dictionary and SAP are written by hand, so if you change the spec, update `data/data_dictionary.csv`, `docs/SAP.md`, and the answer key below to match. Then re-run the solutions to confirm the results.

**Why the generator isn't in the participant zip:** the script shows exactly which problems were planted and where (the 1200 SBP, the `-99` codes, the duplicate rows, and so on). Participants would have the answers to the cleaning exercise before they start. It stays in `instructor/`, and only `materials/` goes into the zip.
