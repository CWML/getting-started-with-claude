# Instructor materials

Everything here is for the instructor: prep, teaching notes and answer keys for both classes. Participants only download what's in `materials/` (the Part 1 kits and the Part 2 practice project). The Part 1 kit files are made up, except the Kit A article, a real open-access paper that keeps its own license. Part 2 uses real public CDC NHANES data (August 2021–August 2023); only its `data/restricted/` stand-in is fictional.

| Path | What it is |
|---|---|
| `README.md` | This file: Part 1 instructor prep (checklist, workspace check, segment notes, kit answer keys, backup plans, 90-minute add-backs); Part 2 instructor prep (checklist, demo folders and reset, run of show, section notes, backup plans); the NHANES dataset spec; the Part 2 answer key; terms of use; and refreshing the NHANES files |
| `solutions/R/` | Part 2 answer key and demo fallback: `01_prepare.R`, `02_prevalence.R`, the optional `report.qmd`, and `tests/` |
| `part2-answer-key/` | Part 2 `.claude/` folder: the `settings.json` deny rule and the example `check-data` skill |
| `review-outline.md` | A checklist for two reviewers to review both classes |

## Part 1: instructor prep

Teach from the class page, `https://cwml.github.io/getting-started-with-claude/part1.html`, on the projector. Participants follow the same page on their own screens (the link is in segment 1), where they copy prompts, download the kits, and find the take-home material. Keep this guide open on a second screen or printed: the segment notes below give the timing and what to say for each part.

The class page is public, so instructor notes live in this file only, never in `part1.qmd`.

Claude's features, menu names and admin settings change often. The feature descriptions were checked against the Claude Help Center (support.claude.com) and the Claude Code docs on October 30, 2026. When you re-check them, update this date.

**Prep checklist**

- [ ] Replace every remaining `[bracketed placeholder]` in the site pages, the description files and `materials/part1-kits/`. The list below groups them by who can answer.
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

**Placeholders by who can answer** (as of November 10, 2026; site pages, description files and kits)

Some brackets aren't placeholders. Leave these alone: `[committee name]` is a slot participants fill in, `[general knowledge]` is a label Claude is told to use, and the bracketed numbers in the Kit A article are its own citations and confidence intervals. To find what's left, search the site files for `[`.

| Who | Placeholders | Where |
|---|---|---|
| You / the library | `[data services consults, office hours]` | `part2.qmd` (Resources) |
| You / the library | `[add category]` | `part2-description.md` |
| You / the library | `[library license guidance]` | `materials/part1-kits/README.md` |
| ITS | `[how to check / who to ask]` (Claude Code seats) | `index.qmd`, `part2.qmd` |
| ITS | `[link to current install instructions]` (standalone Claude Code CLI) | `index.qmd` |
| ITS | `[30 days by default, or Yale's setting]` (chat retention) | `part1.qmd` |
| HSIT / HIPAA Privacy Office | `[HSIT / HIPAA Privacy Office contact]` | `index.qmd` |

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

Features in the HIPAA-supported version may differ: some are off, and it keeps an older layout. Check with [ITS].

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

*6. Everyday chat (0:16 – 0:19)*

**0:16 (3 min):** 30 seconds to send the prompt, 1 min on the chat box table, 1.5 min on the three switches and the "/" look. The point: a plain chat is fine for everyday tasks; a Project is for work you come back to.

*6. Everyday chat (0:16 – 0:19) › Research, web search and memory*

Before class, open **+** in a new chat in both Yale workspaces and screenshot it. Show only what's there: Research needs an Opus model enabled for the role, and the HIPAA-supported version may differ. Also type "/" and screenshot what appears (skills, connectors, styles). Styles are being folded into skills; a migrated style may show up as `/name-style`. Mention that only if someone asks.

Tie the last line back to segment 2: web search and Research give you links, which makes checking easier, but a link isn't proof until you open it.

*7. Models, effort and skills (0:19 – 0:24)*

**0:19 (5 min):** talk and show, no hands-on. 2 min on the model menu, 2 min on skills, 1 min for questions. Open each on your screen; participants just watch.

*7. Models, effort and skills (0:19 – 0:24) › Models and effort*

Open the menu on screen. Current models (check the menu before class): Fable 5.1, Opus 5.5, Sonnet 5.5, Haiku 5.5, with older ones under "More models." Effort levels: Low, Medium, High, Extra high, Max; each model marks its recommended level "Default."

Fable may need usage credits on a standard seat [confirm Yale seat tiers].

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

Library evidence synthesis service: [link].

*13. Take it with you: the phone app (0:55 – 0:57)*

**0:55 (2 min):** talk and show, no hands-on and no kit prompts. Cut option: make this a 1-minute walk through the table (saves 1 min).

*13. Take it with you: the phone app (0:55 – 0:57) › What you can do on your phone*

If you can, mirror the phone (iPhone Mirroring or QuickTime) and show a Project, a past chat, the voice mode icon, and the Code tab. Don't run voice mode. Check before class that Projects appear in the phone app for both workspaces.

Bridge sentence for the Code tab: "In *Analyzing research data with Claude Code*, /rc connects this tab to a Claude Code session on your laptop (if your organization has turned on Remote Control)."

*14. Cowork and the bridge to Claude Code (0:57 – 0:59)*

**0:57 (2 min). Talk only.** Cut option: say Cowork in one sentence (saves 1–2 min).

*14. Cowork and the bridge to Claude Code (0:57 – 0:59) › Cowork in brief*

Don't demo. Spend about a minute: the four steps, then the comparison table, landing on "chat answers, Cowork does." Cowork is on Yale's standard Enterprise accounts, not the HIPAA-supported version. Claude in Chrome (if enabled) is Cowork in your browser: same cautions.

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

Two instructors teach *Analyzing research data with Claude Code* from the class page, `https://cwml.github.io/getting-started-with-claude/part2.html`, on the projector. There is no slide deck. Participants follow the same page on their own laptops. The page is public, so all timing, what to say, checkpoints and fallbacks live here, never on `part2.qmd`. The page shows no times, only four "aim to finish" lines (about 15, 50, 65 and 80 minutes in; the run of show below has the exact timing).

- **L (lead):** at the projector. Drives Positron, narrates, demos each step once, and owns transitions.
- **R (roamer):** walks the room, owns the clock and the cut decisions, triages laptops, and hands out the catch-up zip. R's laptop is signed in and open on the finished demo folder, ready to take over the projector.

Claude Code changes almost weekly. This guide was checked against code.claude.com/docs in **November 2026** (menu labels last checked on November 10, 2026, against the installed extension, version 2.1.319; record the version from `/status` each time you re-check). The week before class, update the extension and re-check every item marked **check before class**. Positron installs the extension from its own mirror of the Open VSX catalog, and it isn't the editor the docs describe. Items marked **(if enabled)** depend on enterprise admin settings. Replace every `[bracketed placeholder]` on the page.

**Instructor files (repo only):** this file (prep, run of show, section notes, dataset spec, answer key), `instructor/solutions/R/` (finished scripts, tests and report: your fallback), and `instructor/part2-answer-key/` (the deny rule and the example `check-data` skill).

### Prep checklist

**Two weeks to one week before**

- [ ] Fill in `[how to check for a Claude Code seat / who to ask]` before advertising the class. A standard seat without Claude Code signs in to claude.ai but fails in the panel.
- [ ] Confirm with ITS or the account team that 18 people can use Claude Code at once for 90 minutes without hitting org rate limits. Ask whether your role has an effort cap. `[Record results here]`
- [ ] **Check before class (admin):** which workspace participants use (standard enterprise or HIPAA-supported); whether skills are enabled in Claude Code; whether `/code-review` is available. Anthropic's HIPAA page says the VS Code and JetBrains extensions aren't covered by its BAA. It doesn't mention Positron. Confirm with ITS, and never say the standard account covers PHI. `[Record results here]`
- [ ] Update the Claude Code extension in Positron on the demo laptops. Note the version from `/status` and put it in the setup email as the minimum. Then turn off extension auto-update on the demo laptops until class is over, so the demo doesn't change the morning of class.
- [ ] Pin Manual mode on the demo laptops: in Positron's *user* settings, set `claudeCode.initialPermissionMode` to `manual`. The extension ignores a project's `permissions.defaultMode`. Without the setting, the panel starts in the mode you last picked, so check the mode indicator at the start of each session.
- [ ] **Check before class (Positron), and fix the page if a label differs:**
  - [ ] The Spark icon in the editor toolbar and the **✻ Claude Code** status-bar entry.
  - [ ] `/status` shows the version, model and account.
  - [ ] The `/` menu: **Customize → Permissions** exists, and adding a rule there saves to the project's `.claude/settings.json`. If not, everyone uses the JSON file.
  - [ ] Whether a new deny rule works at once or needs a new conversation.
  - [ ] Plan mode: how to enter it (mode indicator or `/plan`), that the plan opens as a document, and the exact approval labels. In extension 2.1.319 the buttons read **"Yes, and use auto mode"** (or **"Yes, and auto-accept"** when auto mode isn't available), **"Yes, and manually approve edits"** and **"No, keep planning"**. Participants choose **"Yes, and manually approve edits"**.
  - [ ] Side-by-side diffs for each edit, and the approval prompt for `Rscript`.
  - [ ] The context indicator, `/compact`, `/usage`, `/export`, and the hover **rewind** button.
  - [ ] The model and effort picker at the bottom of the prompt box, and which effort levels your org allows.
  - [ ] Whether Positron's Explorer shows the `.claude` folder (it depends on `files.exclude`).
  - [ ] Skills: after you add `.claude/skills/check-data/SKILL.md`, does `/check-data` appear in a new conversation? Does `/reload-skills` work in the panel?
  - [ ] `claude --resume` in Positron's Terminal lists the panel conversation (needs the standalone CLI).
  - [ ] The Data Explorer opens a data frame from the Console (`View(d)`, or the table icon in the Variables pane).
- [ ] Install `survey` and `haven` on the demo laptops and check them: `Rscript -e 'library(survey); library(haven); library(testthat)'`.
- [ ] Run the solutions (see "How to run the solutions" below) and check every number against the answer key.
- [ ] Build the two demo folders (below).
- [ ] **Windows rehearsal.** Run the whole class once on a Windows laptop and record fixes in the backup plans. Watch for:
  - [ ] **Extract All** makes a folder inside a folder (`nhanes-bp\nhanes-bp`). Open the inner one: `CLAUDE.md` must be at the top of Positron's Explorer. Otherwise every relative path in the prompts fails, and the deny rule points at the wrong place.
  - [ ] Documents redirected to **OneDrive** (or iCloud on a Mac). Sync can lock files under `.git` and copies the project to the cloud. Unzip to a folder that isn't synced, such as `C:\Users\<you>\claude-class\`.
  - [ ] **CRLF warnings** ("LF will be replaced by CRLF") on the first `git add`. They're harmless.
  - [ ] **R not on PATH.** The R installer doesn't add `Rscript` to PATH, so Claude's first `Rscript` call fails with "not found." Add `C:\Program Files\R\R-4.x.x\bin` to PATH, then restart Positron. Claude Code on Windows also needs Git for Windows (check before class).
  - [ ] git identity: "Please tell me who you are" on the first commit. Fix with `git config --global user.name "Your Name"` and `git config --global user.email "you@yale.edu"`.
- [ ] Record a backup video and screenshots of each demo: the deny test, the plan and its approval, a diff, the first error-and-fix loop, the Data Explorer checks, the prevalence output, the failing-then-passing tests, and the skill.

**Three to five days before**

- [ ] Send the class page and the [setup steps](https://cwml.github.io/getting-started-with-claude/index.html#setup-part2) with a three-question reply: operating system; did both smoke-test prompts work (yes/no); do you have a Claude Code seat? The smoke test on the setup page asks Claude to describe the project ("If Claude describes CDC NHANES blood-pressure data from 2021–2023, you're ready") and to run `Rscript --version` and `git --version`.
- [ ] Two days before, R follows up with anyone who hasn't replied, and lists people without a seat so they can be paired.
- [ ] Python users: tell them the class is R only. They can pair with an R user or follow along.

**Day of class**

- [ ] Room: test the projector with Positron zoomed in and a large panel font, from the back row of SHM L 111. Check power strips for 18 laptops and a guest Wi-Fi fallback. Bring green and red sticky notes.
- [ ] Write the class-page link and the catch-up zip link (`nhanes-bp-checkpoint.zip`) on the whiteboard, or show a QR code.
- [ ] Reset the live demo folder (below). Start a new conversation in Manual mode and run `/status` and `/usage`.
- [ ] Avoid long rehearsals on the lead's account on class day, so usage limits don't bite during class (check how Yale seats are limited).
- [ ] Open the room 15 minutes early. R runs a setup clinic.

### Demo folders and reset

Keep two folders, outside OneDrive or iCloud.

1. **`~/claude-class/nhanes-bp`**: the live demo. It's a fresh unzip, exactly what participants have, with no git. L sets it up live in "What Claude sees, and who's in control," so the projector matches what participants see.
2. **`~/claude-class/nhanes-bp-tags`**: a git repo with three tags, `start`, `checkpoint` and `complete`. Use it to jump ahead when a demo stalls, and as R's take-over laptop.

Build them after rendering the site (the zip is built at render time; or download it from the live site):

```bash
REPO=~/Documents/GitHub/claude-code
CLASS=~/claude-class
ZIP="$REPO/docs/downloads/nhanes-bp.zip"
mkdir -p "$CLASS" && cd "$CLASS"

# 1. Live demo folder: a fresh unzip, no git
rm -rf nhanes-bp && unzip -q "$ZIP" -d "$CLASS"

# 2. Tagged folder
rm -rf nhanes-bp-tags tmp && mkdir tmp && unzip -q "$ZIP" -d tmp && mv tmp/nhanes-bp nhanes-bp-tags && rmdir tmp
cd nhanes-bp-tags
printf '.claude/settings.local.json\nCLAUDE.local.md\n.Rhistory\n.Rproj.user/\n' > .gitignore
mkdir -p .claude && cp "$REPO/instructor/part2-answer-key/.claude/settings.json" .claude/
git init -q && git add -A && git commit -qm "Start: project, deny rule, .gitignore" && git tag start

cp "$REPO/instructor/solutions/R/01_prepare.R" R/
Rscript R/01_prepare.R
git add -A && git commit -qm "Checkpoint: prepare script and outputs" && git tag checkpoint

cp "$REPO/instructor/solutions/R/02_prevalence.R" R/
cp "$REPO/instructor/solutions/R/report.qmd" reports/
cp -R "$REPO/instructor/solutions/R/tests" .
cp -R "$REPO/instructor/part2-answer-key/.claude/skills" .claude/
Rscript R/02_prevalence.R && Rscript tests/run_checks.R && quarto render reports/report.qmd
git add -A && git commit -qm "Complete" && git tag complete
```

**Pull in a finished file** without touching the live folder's history (run from the live folder):

```bash
git -C ~/claude-class/nhanes-bp-tags show complete:R/01_prepare.R > R/01_prepare.R
```

Swap in `R/02_prevalence.R`, `tests/testthat/test-prepare.R`, `tests/run_checks.R` or `.claude/skills/check-data/SKILL.md` the same way (create the folder first if needed). To show a whole stage, open the tags folder in a second Positron window and run `git switch --detach checkpoint` (or `complete`); `git switch -` goes back.

**Demo reset** (before class and after each rehearsal):

```bash
cd ~/claude-class
rm -rf nhanes-bp && unzip -q ~/Documents/GitHub/claude-code/docs/downloads/nhanes-bp.zip -d ~/claude-class
```

Then, in the panel: start a new conversation, set the mode to **Manual**, archive rehearsal sessions in the session history, and clear rehearsal notes in **Customize → Memory**. If you made a personal copy of the skill in `~/.claude/skills/check-data`, delete it so the project skill is the one that loads.

### Run of show (two instructors)

L = lead at the projector. R = roamer and timekeeper. Minutes sum to 90.

| Time | Min | Section (page heading) | L | R | Checkpoint |
|---|---|---|---|---|---|
| −0:15–0:00 | – | Doors open | Demo laptop on the projector: fresh folder, Manual mode, `/status`, `/usage`, zoom up | **Setup clinic.** Checks each laptop: right folder (`CLAUDE.md` at the top), panel signed in. Pairs people without a seat. Hands out sticky notes | – |
| 0:00–0:05 | 5 | Open the project | Introduces both instructors and the roles ("red sticky = come help"). Says the class goal. Opens the folder and panel, runs `/status` | Fixes sign-ins and nested folders. Sets up driver/navigator pairs | – |
| 0:05–0:16 | 11 | What Claude sees, and who's in control | "Sends what it reads." Opens `CLAUDE.md`, adds the deny rule, runs the deny test, picks Manual, asks Claude to `git init` and commit | Checks deny-test messages on screens (denied, not refused). Fixes dot-folder, CRLF and git-identity problems. Calls "2 minutes left" at 0:14 | **1 (0:16):** permission-denied message seen; `git log` shows one commit |
| 0:16–0:29 | 13 | Plan before you code | Times the 4-minute "first, you." Runs the plan prompt. Asks "What did Claude decide silently?" Shows the approval choice | Watches for people who chose auto mode. Answers decision questions without giving the reference answers away | – |
| 0:29–0:44 | 15 | Build the prepare script | Narrates the first write → run → error → fix loop. Reviews one diff out loud. Runs the explain-it-back prompt | Red stickies first. Handles `Rscript` not found, package errors and approval mistakes | **2 (0:40):** `output/prep_log.csv` exists; the not-pregnant step shows 6,084 |
| 0:44–0:52 | 8 | Check it yourself | Demos the n-flow check and one `SEQN` trace on screen | Roams. Helps people open the Data Explorer | **3 (0:52):** checks done, second commit made |
| 0:52–0:57 | 5 | Break / catch-up | Resets the projector if needed (pull in the checkpoint files) | Points stragglers to `nhanes-bp-checkpoint.zip`. Pairs swap driver and navigator | – |
| 0:57–1:08 | 11 | Estimate, then decide what to report | Asks for predictions. Runs the prevalence prompt. Reveals Data Brief 511 | Roams. At 1:01 decides whether this becomes a lead demo (cut 2) | **4 (1:06):** prevalence table saved; overall estimate 47.7% |
| 1:08–1:22 | 14 | Verification and research integrity | Runs the test-first prompt (fail, then pass) while everyone runs it. Walks through the "why decisions matter" table. Demos "read the claims" | Leads the discussion question: walks the room, takes two answers | – |
| 1:22–1:26 | 4 | Working well, and skills | Context, model and effort in about a minute. Shows the `check-data` skill and how to run it (about 3 minutes). The try-it and terminal moment are for people who are ahead, or for home | Watches the clock (hard stop 1:26) | – |
| 1:26–1:30 | 4 | Wrap-up | Three takeaways, takes questions | Shows the survey QR code on the page. Collects the no-seat list for follow-up | – |
| After | – | Reset | Resets the demo folder | Logs problems seen (OS, failure, fix) in the backup plans below | – |

**Checkpoints:** at each one, L asks everyone to put up a green sticky (done) or a red one (stuck). R goes to the red ones first. At checkpoint 3, anyone still red downloads the catch-up zip during the break.

**Realistic step times** (with Claude's response time at the default model and medium effort; re-measure in rehearsal): deny rule + test 3–4; git init with approvals 2–3; plan prompt 2–4 min; reading the plan and answering decisions 4–5; prepare-script generation 1–2; diff review 2; run plus one or two fixes 3–6; Data Explorer checks 4–6; prevalence script 4–6; tests (write, fail, pass) 5–7 (Manual mode: 2–3 file diffs and 2 `Rscript` approvals).

**Cut order if you run late** (R calls it; Verification is never cut):

1. **Working well, and skills** shrinks to one paragraph: L reads the context tip and points to the `SKILL.md` example (saves about 2 min).
2. **Estimate, then decide what to report** becomes a lead demo. Participants make the prediction and the "you decide" call, but watch the script run on the projector (saves about 5 min of pacing spread).
3. If still behind: skip the optional Quarto report and shorten "Check it yourself" to the n flow and one `SEQN` trace (saves about 3 min).

### Section notes

Notes for each section of the class page, in order. Times match the run of show.

#### Open the project (0:00–0:05)

**L:** Say the goal word for word: "This class doesn't replace learning R or statistics. You'll learn where a coding agent speeds up good analysis, and where your expertise must stay in control." Point out the pattern on the page: each step says what Claude does and what *you* decide.

Disclose your own AI use in 15 seconds: "These materials were drafted with Claude and Claude Code, and checked by us."

Open the folder (File → Open Folder → `nhanes-bp`), open the panel (Spark icon or the ✻ Claude Code status-bar entry), and run `/status`. Show the panel-versus-terminal table in one sentence: we use the panel; the terminal is optional. The panel and the CLI share settings, `CLAUDE.md` and conversation history.

**R:** Fix sign-ins. If the extension won't load, try **Developer: Reload Window**, then VS Code, then `claude` in the Terminal (if the CLI is installed). Anyone without a seat pairs as **navigator**: the navigator reads the analysis plan, makes the "You decide" calls, and runs the Data Explorer checks on their own laptop from the catch-up zip, which needs no Claude account. First they run `source("R/01_prepare.R")` in Positron's Console (no PATH setup needed), then open `output/analysis_data.csv`. Pairs swap at the break. Python users pair with an R user. A free Claude account won't work for this class: it doesn't include Claude Code.

#### What Claude sees, and who's in control (0:05–0:16)

**L, what to say:**

- "Claude Code sends what it reads": file contents, command output, selected text, and the name of the open file go to Anthropic. Reading 10 rows of a file sends those 10 rows.
- Two safe patterns: Claude writes code and you run it on restricted data somewhere else; or you build and test on public or synthetic data first.
- Today's data are real, public, de-identified CDC survey data. The NCHS data user agreement still applies: statistical analysis only, never try to identify anyone, never link to other data. Read the local policy once the placeholder is filled in: `[Yale data classification / policy link]`. A HIPAA-supported version of Claude exists by request, but it doesn't approve any project. Don't say the standard account covers PHI. Check with `[ITS]`.
- `CLAUDE.md` is **advice**: Claude reads it and usually follows it. The deny rule is **enforcement**: Claude Code blocks the tool call.

**The deny test.** Add `Read(./data/restricted/**)` through `/` → **Customize → Permissions**, or by creating `.claude/settings.json`. Then ask Claude to read `data/restricted/STANDIN_linkage_request.txt`. The expected result is a **permission-denied message** from Claude Code. A polite "I shouldn't read that" without trying is Claude following `CLAUDE.md`, which is advice, not proof the rule works. Ask it to try anyway so the block shows. If anyone sees the canary string `RESTRICTED-CANARY-7Q4Z`, their rule isn't loaded: wrong folder (nested), file saved to the wrong place, a JSON typo, or a new conversation needed.

Say the gap in one sentence: the deny rule stops Claude's Read tool, but not an R script Claude writes that opens the file. The real rule is "don't put restricted data in the project." Don't demo the gap.

Pick **Manual** in the mode indicator. Then ask Claude to `git init`, write `.gitignore`, and make the first commit. Git is the safety net. Rewind (hover a message) undoes Claude's file edits and shell changes to files Claude already edited. It doesn't undo files that only a script wrote, or most subagent edits. Git is the full record.

**R:** Check screens for the denied message. Dot-folder hidden in Explorer: have the person ask Claude to "create `.claude/settings.json` with exactly this text" and paste the JSON from the page. CRLF warnings on Windows are harmless. Git identity error: see the backup plans. Call "2 minutes left" at 0:14.

**Checkpoint 1 (0:16):** permission-denied message seen; `git log` shows one commit.

#### Plan before you code (0:16–0:29)

**L:** Time the 4-minute "first, you" step out loud. People open `data/data_dictionary.csv` first (not the plan), write two problems they expect and answer the three questions, then open `docs/analysis-plan.md` to compare. Don't skip this: it's what makes the comparison work.

Run the plan-mode prompt. Claude will ask to run R commands to inspect the XPT files. Approve them, and point out that the output (up to 10 rows) is sent to Anthropic, which is fine for public data. Read the plan aloud briefly, then ask the room:

- "What did Claude catch that you missed, and the reverse?"
- "What did Claude decide silently?" Because the plan fixes the key decisions, ask: did Claude follow it, restate it correctly, or override it? Real gaps it may fill silently: output format (csv/rds), new column names, rounding, whether to keep the raw BPQ columns.

Take two examples aloud for the C / Me sorting: "merge on SEQN" (C) vs "what a blank BPQ150 means" (Me).

Approve with **"Yes, and manually approve edits"**, not "Yes, and use auto mode" (or "Yes, and auto-accept"). Then open the collapsed "Reference decisions for today" callout.

**Where people get stuck:** someone picks auto mode (R switches them back to Manual in the mode indicator); Claude starts writing code before the plan is approved (say "No, keep planning"); Claude quotes CDC's 47.7% from memory (note it; it's a talking point in Verification). Approving the plan starts the work at once. If Claude also starts on R/02_prevalence.R, reject that diff and say 'Stop after R/01_prepare.R.'

#### Build the prepare script (0:29–0:44)

**L:** Run the prompt for `R/01_prepare.R`. Review the first diff out loud: "Does this line do what the plan says?" Approve `Rscript`. The first time an error appears, narrate the loop: Claude writes, runs, reads the error, fixes. That loop is the core value of a coding agent. Then run the explain-it-back prompt and find the line that carries out one of your decisions (the medication skip rule is a good one).

**Where people get stuck:**

- `Rscript` not found (Windows PATH): see the backup plans.
- `haven` or `here` not installed: approve `install.packages()` only for packages on the setup list.
- The n doesn't end at 6,084. Compare the log step by step. The usual causes: `RIDEXPRG != 1` keeps only 1,036 people (see the answer key); rows with a blank `BPQ150` were dropped; the weight filter was applied as a row filter; or the steps ran in a different order (the step counts change, but the final n should still be 6,084).
- Claude edits a file in `data/raw/`. Stop it, `git checkout -- data/raw`, and restate the rule.

**Checkpoint 2 (0:40):** `output/prep_log.csv` exists, and the not-pregnant step shows 6,084. If the live demo stalls, pull in `01_prepare.R` from the tags folder, run it, and walk through it.

#### Check it yourself (0:44–0:52)

**L:** Demo the n-flow check and one trace on screen, then let people do the rest. Read the outputs in the Console and open them in the Data Explorer (`View()`, or the table icon in the Variables pane). Expected answers:

- **n flow:** 8,153 adults → 6,337 examined → 6,123 with at least one reading → 6,084 not pregnant.
- **No 7 or 9 left** in the BPQ variables. In the analysis population, 4 `BPQ020` values and 3 `BPQ150` values were coded 7 or 9; they should now be missing.
- **Max age 80.** It means "80 or older": CDC top-codes age for privacy. 320 people (5.3%) are coded 80. It's fine for the 60+ group, but a mean age would be slightly wrong.
- **Trace one `SEQN`** by hand. Good examples:
  - `130378`: SBP 135, 131, 132 → mean 132.7; DBP 98, 96, 94 → mean 96.0; `BPQ150 = 1` → hypertension yes.
  - `130380`: SBP 111, 112, 104 → mean 109.0; DBP 79, 80, 76 → mean 78.3; `BPQ020 = 2` (never told), `BPQ150` blank → not taking medication → hypertension no. This one shows the skip rule.
- **Blank `BPQ150`:** 3,842 people in the analysis population were never told they had high BP (`BPQ020 = 2`), so `BPQ150` was skipped. All of them should be "not taking medication" (`bp_med = 0` in the solution). Another 7 have no usable medication answer (a 7 or 9 in `BPQ020` or `BPQ150`); their hypertension status comes from their readings alone, which is CDC's rule too.

Commit. Then point to the catch-up note on the page.

**Checkpoint 3 (0:52):** checks done; `git log` shows a second commit.

#### Break / catch-up (0:52–0:57)

**R:** Anyone still red downloads `nhanes-bp-checkpoint.zip`. It unzips to `nhanes-bp/`, so unzip to a different folder or rename the old one first (for example to `nhanes-bp-old`), then open the new folder. It has `R/01_prepare.R` but no outputs, no `.claude/settings.json` and no git. Have them check the mode is Manual, re-add the deny rule from the page, redo the Start version control prompt (git init and first commit), then run `source("R/01_prepare.R")` in the Console and check it ends at 6,084. Pairs swap driver and navigator.

**L:** If the projector is behind, pull in the checkpoint files from the tags folder and run the script.

#### Estimate, then decide what to report (0:57–1:08)

**L:** Ask for predictions first, by show of hands: will the unweighted estimate be higher or lower than the weighted one? Answer: **higher** (53.3% vs 47.7%). Older adults make up 43.7% of the examined adults in the sample but 30.0% of the population once weighted, and hypertension rises with age. Within each age group, the unweighted and weighted numbers are close.

Run the prompt for `R/02_prevalence.R`. Watch for these in Claude's code:

- The design must be built on all examined participants (`WTMEC2YR > 0`) and then `subset()` to the analysis population, as the plan says. Filtering rows first can change the standard errors and CIs; the point estimates stay the same.
- `svyciprop(method = "beta")` gives the Korn–Graubard CIs CDC uses. A `svymean` CI is a Wald interval, so it will differ slightly.
- Exam weight `WTMEC2YR`, not interview weight `WTINT2YR`.

**You decide:** report the weighted estimates, because the question is about U.S. adults. The unweighted number describes only the people in the sample. Then reveal Data Brief 511. If someone doesn't match, compare the n's first. The optional Quarto report must read its numbers from `output/`: no typed numbers.

**R:** At 1:01, if fewer than half the room has started the script, call cut 2 (L demos it). `survey` not installed: approve `install.packages("survey")`, or pair.

**Checkpoint 4 (1:06):** prevalence table saved in `output/`; overall 47.7%.

#### Verification and research integrity (1:08–1:22)

**Never cut this section.**

**L:** Everyone runs the tests prompt; L runs it on the projector at the same time. If fewer than half the room sees FAIL then PASS by 1:15, L finishes on screen and participants read the `tests/` diff from the projector. The tests should **fail** on an unprepared merge and **pass** on the prepared data. Then open the diff of `tests/` and check that Claude didn't loosen a test to make it pass. If it stalls, pull in `tests/` from the tags folder and run `Rscript tests/run_checks.R`.

Walk through the "Why decisions matter" table (answer key below). Before you show the 95.0% row, ask the room to guess what a missing skip rule does. Every row comes from the same files; only one human decision changed.

L demos Read the claims on the `complete` tag's `reports/report.qmd`. The solution report is deliberately clean, so first add one causal sentence to it (for example, "Getting older causes hypertension.") to give the room something to catch. The room calls keep/revise/delete. Look for causal language ("being older causes hypertension"), trend claims (this is one cycle; trends are out of scope), and missing caveats about who was excluded. A statistician or co-author still reviews the work. `/code-review` (if available) is a second reader, not a sign-off.

Forking paths: with many small choices, you can steer toward any number you like. Claude may already know CDC's 47.7%. The numbers must come from your scripts, and the tests must be written from the plan, not from the answer. If Claude says "this matches CDC" before the reveal, ask where that number came from.

Disclosure and audit trail: `git log`, `/export` for the conversation, and the version and model from `/status`. Point to `[link to library guidance on AI disclosure]`.

**R:** Leads the discussion question. Walk the room and take two answers. Keep time: hard stop at 1:22.

#### Working well, and skills (1:22–1:26)

**L, about 1 minute on working well:** point at the context indicator. Start a new conversation for a new task. `/compact` with a focus keeps what matters. After two failed corrections, start a fresh conversation with a better prompt (the docs' wording). One sentence on the model and effort picker at the bottom of the prompt box; your org may limit the choices.

**About 3 minutes on skills:** a skill is a saved set of instructions in `.claude/skills/<name>/SKILL.md`. You run it with `/<name>`, or Claude loads it when the description matches. Show the `check-data` example on the page. The try-it and `claude --resume` are optional, for people who are ahead or for home. If someone tries it: create the file, start a new conversation, run `/check-data data/raw/BPQ_L.xpt`. It should report the 7 and 9 codes, the ranges and any duplicate `SEQN`, and it must not edit data. Skill uploads in the Claude app (if enabled) accept fewer frontmatter fields, so this example won't upload there as is: `disable-model-invocation` isn't allowed.

**Where people get stuck:** a file saved as `SKILL.md.txt`; `SKILL.md` placed directly in `.claude/skills/` instead of its own `check-data/` folder; `.claude` created inside `R/`; the skill doesn't appear until a new conversation starts (or `/reload-skills`; check before class).

**Terminal moment (optional, for people who are ahead):** in Positron's Terminal, `claude --resume` lists the panel conversation and picks it up. It needs the standalone CLI.

**Beyond today:** read the names only. Don't promise a follow-up class. Don't demo or explain them today.

#### Wrap-up (1:26–1:30)

**L:** Say the goal sentence again. Read the three takeaways: protect first; plan, build, check; you make the decisions.

**R:** Shows the survey link or QR. Collects the list of people without a seat for follow-up.

**Try at home answer key** (the page's take-home items):

- **The CDC SAS excerpt** (`legacy/db511_prep_excerpt.sas`, if shipped): the trap is the pregnancy filter. SAS `ridexprg ne 1` keeps missing values, because SAS treats missing as not equal to 1. A literal R translation, `RIDEXPRG != 1`, returns `NA` for the 6,650 adults with no pregnancy status, and `filter()`/`subset()` drop them: n = 1,036 and 20.1%. Use `!(RIDEXPRG %in% 1)`. Also: SAS `mean(of ...)` skips missing values like `na.rm = TRUE`; SUDAAN's `subpopx` matches `survey::subset()`, not a row filter; `bpq050a` is the earlier cycle's variable (the BPQ_L codebook says `BPQ150` replaced it), not a CDC bug.
- **Awareness, treatment, control** among adults with hypertension: 59.2%, 51.2%, 20.7%.
- **Age-adjusted** overall prevalence: 44.5% (2000 U.S. standard population weights 0.4203, 0.3572, 0.2225 for 18–39, 40–59, 60+).

### Backup plans

| Problem | Fallback |
|---|---|
| Wi-Fi or Claude outage | Play the recorded demos. Open the tags folder at `complete` and walk through the scripts, the prep log and the answer key |
| Extension won't install or sign in, or a panel feature is missing | **Developer: Reload Window**; try VS Code; or run `claude` in the Terminal if the CLI is installed |
| No Claude Code seat | Driver/navigator pairing. The navigator makes the decisions, runs `source("R/01_prepare.R")` in the Console from the catch-up zip, and does the Data Explorer checks |
| Nested folder after Extract All | Open the inner `nhanes-bp` folder. `CLAUDE.md` must be at the top of Explorer |
| Project in OneDrive or iCloud | Move it to a folder that isn't synced, such as `~/claude-class/`, before `git init` |
| `Rscript` not found (Windows) | Add `C:\Program Files\R\R-4.x.x\bin` to PATH and restart Positron, or pair |
| "Please tell me who you are" on commit | `git config --global user.name "Your Name"` and `git config --global user.email "you@yale.edu"` |
| Deny test shows the file's contents | The rule isn't loaded: check the folder, where `settings.json` was saved, the JSON, and start a new conversation |
| Someone chose "Yes, and use auto mode" | Switch back to **Manual** in the mode indicator. Review the edits already made with `git diff` |
| `survey` or `haven` won't install | Pair, or follow on the projector |
| A participant hits a usage limit | Pair as navigator, or pick a smaller model in the picker if your org allows it |
| The lead hits a usage limit or the demo laptop fails | R's laptop, already open on the tags folder, takes over the projector |
| The live demo goes off track | Pull in the finished file from the tags folder (`git -C ... show complete:<path>`) and walk through it |
| Claude's numbers differ from the answer key | Compare the n at each step first. It's a verification moment, not a failure |
| Participant fell behind | `nhanes-bp-checkpoint.zip` at the break (see Break / catch-up) |
| `/check-data` doesn't appear | Check the folder and file name, then start a new conversation |
| Running long | Follow the cut order. **Never cut Verification** |

## Dataset spec

This is the single source of truth for the class dataset. The data dictionary, analysis plan, class page and solutions must all use these names.

**Source:** CDC/NCHS National Health and Nutrition Examination Survey (NHANES), **August 2021–August 2023** public-use files. Real, public, de-identified survey data. Downloaded 2026-11-10. The files are unmodified; only the `data/restricted/` stand-in is fictional.

### Files (participants see these)

| Path in `materials/nhanes-bp/` | What it is |
|---|---|
| `README.md` | What this is, source, citation, data user agreement summary, folder map |
| `CLAUDE.md` | Study rules (advice), R only |
| `docs/analysis-plan.md` | One-page analysis plan with the decisions fixed in advance |
| `docs/codebooks/DEMO_L.htm`, `BPXO_L.htm`, `BPQ_L.htm` | CDC codebooks, unmodified |
| `data/data_dictionary.csv` | Kept variables only. Columns: `variable, file, label, type, units, allowed_values, missing_codes, skip_logic, notes` |
| `data/raw/DEMO_L.xpt`, `BPXO_L.xpt`, `BPQ_L.xpt` | Unmodified CDC SAS transport files, read with `haven::read_xpt()` |
| `data/raw/README.md` | Source URLs, download date, SHA-256 of each file, "never edit these" |
| `data/restricted/STANDIN_linkage_request.txt` | **Fictional** stand-in with the canary string `RESTRICTED-CANARY-7Q4Z`. Story: a collaborator asked to link their clinic extract to NHANES. That would be PHI, and the NCHS agreement forbids linking |
| `legacy/db511_prep_excerpt.sas` | Optional. A UTF-8 excerpt of CDC's Data Brief 511 data-prep code (public domain), for the try-at-home prompt |
| `R/`, `output/`, `reports/` | Empty (`.gitkeep`); participants fill them |

After class you can `/export` a transcript and search it for `RESTRICTED-CANARY-7Q4Z` to show the stand-in was never read.

### Files and rows

| File | Rows | One row per | Notes |
|---|---|---|---|
| `DEMO_L` | 11,933 | participant (`SEQN`) | Everyone screened. 8,860 examined (`RIDSTATR = 2`); 3,073 interviewed only, with `WTMEC2YR = 0` |
| `BPXO_L` | 7,801 | examined participant (`SEQN`) | Oscillometric BP. Systolic readings per person: 0 (283), 1 (12), 2 (28), 3 (7,478) |
| `BPQ_L` | 8,501 | participant aged 16+ (`SEQN`) | BP questionnaire |

Every `SEQN` is unique within each file, and every `SEQN` in BPXO_L and BPQ_L is in DEMO_L. Merge with left joins onto DEMO_L.

### Variables kept

| Variable | File | Meaning | Codes |
|---|---|---|---|
| `SEQN` | all | Respondent ID | Join key |
| `RIDSTATR` | DEMO_L | Interview/exam status | 1 = interviewed only, 2 = interviewed and examined |
| `RIAGENDR` | DEMO_L | Sex | 1 = male, 2 = female |
| `RIDAGEYR` | DEMO_L | Age in years at screening | 0–80; **80 means 80 or older** (top-coded for privacy) |
| `RIDRETH3` | DEMO_L | Race and Hispanic origin | 1, 2, 3, 4, 6, 7 (no code 5); see the codebook. Not used in the core analysis |
| `RIDEXPRG` | DEMO_L | Pregnancy status at exam | 1 = pregnant, 2 = not pregnant, 3 = could not be determined. **Released only for women 20–44**; missing for everyone else (6,650 of 8,153 adults) |
| `WTMEC2YR` | DEMO_L | Exam (MEC) weight | 0 for the interviewed-only. **Use this one** |
| `WTINT2YR` | DEMO_L | Interview weight (optional) | Not for exam analyses |
| `SDMVPSU` | DEMO_L | Masked variance PSU | 1–2 |
| `SDMVSTRA` | DEMO_L | Masked variance stratum | 173–187 (15 strata × 2 PSUs, so 15 design degrees of freedom) |
| `BPXOSY1`–`BPXOSY3` | BPXO_L | Systolic readings 1–3 (mmHg) | Missing if not taken. Range in the analysis population 62–233 |
| `BPXODI1`–`BPXODI3` | BPXO_L | Diastolic readings 1–3 (mmHg) | Range in the analysis population 26–142 |
| `BPQ020` | BPQ_L | Ever told you had high blood pressure | 1 = yes (2,969), 2 = no (5,518), 7 = refused (1), 9 = don't know (10), missing (3) |
| `BPQ150` | BPQ_L | Now taking prescribed BP medication | 1 = yes (2,442), 2 = no (523), 9 = don't know (4), no 7s; **blank (5,532) when `BPQ020` is 2, 7, 9 or missing** |

`BPQ150` replaced `BPQ050A` in this cycle (BPQ_L codebook: the skip pattern changed). `BPQ050A` isn't in BPQ_L.

### Real problems participants meet (nothing is planted)

1. Three files with different row counts, merged on `SEQN`.
2. The `BPQ150` skip: blank means "not asked because never told," not "unknown."
3. Refused and don't-know codes (7, 9) that look like numbers. `mean(BPQ150)` over the BPQ file is 1.187: a meaningless average of codes.
4. One to three readings per person; 214 examined adults have none.
5. Age top-coded at 80.
6. `RIDEXPRG` missing for most adults, which breaks a naive `!= 1` filter.
7. Survey weights and design: the sample isn't a simple random sample. Older adults are 43.7% of examined adults in the sample but 30.0% weighted.
8. Two weights in the file; only the exam weight fits an analysis that uses exam data.

### Analysis plan essentials

- **Question:** what share of U.S. adults had hypertension in August 2021–August 2023, overall, by sex, and by age group (18–39, 40–59, 60+)? Descriptive only: no causal claims, no regression, no trends.
- **Population:** adults 18+ (`RIDAGEYR >= 18`), examined (`RIDSTATR == 2`), at least one SBP or DBP reading, not pregnant (`RIDEXPRG` not equal to 1; missing counts as not pregnant). Report n at each step.
- **Derived:** mean SBP and mean DBP from the available readings 1–3. Hypertension = mean SBP ≥ 130 or mean DBP ≥ 80 mmHg, or currently taking BP medication (`BPQ150 == 1`). A blank `BPQ150` after `BPQ020 == 2` counts as not taking medication. Codes 7 and 9 are missing.
- **Survey design:** `svydesign(ids = ~SDMVPSU, strata = ~SDMVSTRA, weights = ~WTMEC2YR, nest = TRUE)` on all examined participants (`WTMEC2YR > 0`), then `subset()` to the analysis population. Percentages with Korn–Graubard 95% CIs: `svyciprop(method = "beta")`.
- **Benchmark (reveal after participants run their scripts):** NCHS Data Brief 511.
- **Out of scope:** trends, combining cycles (CDC warns against combining this cycle with 2017–March 2020), causal claims, regression.

## Answer key and solutions (Part 2)

Every number below was computed from the shipped files with the plan's method, and checked twice. The headline numbers match NCHS Data Brief 511: Fryar CD, Kit B, Carroll MD, Afful J. *Hypertension prevalence, awareness, treatment, and control among adults age 18 and older: United States, August 2021–August 2023.* NCHS Data Brief, no 511. National Center for Health Statistics; 2024. https://www.cdc.gov/nchs/products/databriefs/db511.htm

### Population flow

| Step | n | Dropped | Why |
|---|---|---|---|
| Adults 18+ in DEMO_L | 8,153 | – | 11,933 participants of all ages |
| Examined (`RIDSTATR == 2`) | 6,337 | 1,816 | Interviewed but not examined |
| At least one SBP or DBP reading | 6,123 | 214 | Examined but no BP readings |
| Not pregnant | 6,084 | 39 | `RIDEXPRG == 1` |

Everyone in the final population with any reading has both an SBP and a DBP reading. 3,242 of the 6,084 (unweighted) have hypertension.

### Key results (weighted, Korn–Graubard 95% CI)

| Group | n | Prevalence | 95% CI | Unweighted |
|---|---|---|---|---|
| **All adults** | 6,084 | **47.7%** | **45.4–49.9** | 53.3% |
| Men | 2,776 | 50.8% | 48.4–53.2 | 56.8% |
| Women | 3,308 | 44.6% | 41.4–47.8 | 50.3% |
| 18–39 | 1,712 | 23.4% | 20.2–26.9 | 23.3% |
| 40–59 | 1,681 | 52.5% | 49.5–55.4 | 53.4% |
| 60+ | 2,691 | 71.6% | 68.7–74.3 | 72.3% |

The unweighted overall estimate is higher mainly because of the age mix: within age groups, weighted and unweighted are close.

**Stretch numbers (Data Brief 511):** among adults with hypertension, awareness 59.2% (`BPQ020 == 1`), treatment 51.2% (`BPQ150 == 1`), control 20.7% (mean BP below 130/80). Age-adjusted overall prevalence 44.5%.

### Why decisions matter

Same files, one decision changed each time. Weighted unless noted.

| Choice | n | Prevalence | Mechanism |
|---|---|---|---|
| Per the plan (weighted, skip rule applied) | 6,084 | **47.7% (45.4–49.9)** | Matches CDC |
| No survey weights | 6,084 | 53.3% | Older adults are over-represented in the sample (43.7% of examined adults vs 30.0% weighted), and hypertension rises with age |
| Interview weight `WTINT2YR` instead of exam weight | 6,084 | 48.2% (45.9–50.5) | The interview weight doesn't adjust for who came to the exam. The BPQ_L codebook says to use exam weights when merging with exam data |
| 140/90 definition instead of 130/80 | 6,084 | 32.4% (29.9–35.0) | The older cutoff. Data Brief 511 uses the 2017 ACC/AHA 130/80 definition |
| Medication skip left as `NA` in `sbp >= 130 \| dbp >= 80 \| BPQ150 == 1` | 3,395 | 95.0% | R's logic: `FALSE \| FALSE \| NA` is `NA`, but `TRUE \| NA` is `TRUE`. People never told they had high BP (blank `BPQ150`) with normal readings become `NA` and drop out; those with high readings stay. The denominator becomes mostly people with hypertension |
| Rows with a blank `BPQ150` dropped (complete case; keeps only codes 1 and 2) | 2,235 | 91.8% | Only people ever told they had high BP answer `BPQ150`, so the analysis is limited to a high-risk group |
| Pregnancy filter written as `RIDEXPRG != 1` | 1,036 | 20.1% | `RIDEXPRG` is released only for women 20–44. For everyone else `NA != 1` is `NA`, and `filter()`/`subset()` drop those rows. Only young women remain. Use `!(RIDEXPRG %in% 1)` |
| Keeping pregnant participants | 6,123 | 47.3% | 39 pregnant women stay in. Small change, but it breaks the plan, and BP changes in pregnancy |

**Other facts worth knowing:** 3,073 interviewed-only participants have `WTMEC2YR = 0`, so the design is built on `WTMEC2YR > 0`. 214 examined adults have no BP readings. Age is top-coded at 80 for 320 people in the analysis population (5.3%; 525 in DEMO_L overall). There are 15 strata × 2 PSUs. In the analysis population, 3,842 people never told they had high BP have a blank `BPQ150`; the plan counts them as not taking medication. Seven more have a 7 or 9 in `BPQ020` (4) or `BPQ150` (3); their medication status is missing, so only their readings decide hypertension. CDC's code (`bpq150=1`) gives the same result.

### The solution files

`instructor/solutions/R/`:

| File | What it does | Writes |
|---|---|---|
| `01_prepare.R` | Reads the three XPT files with `haven`, merges on `SEQN`, applies the population steps (printing n at each), recodes 7/9 to missing, averages readings, derives `bp_med` and hypertension with the skip rule | `output/analysis_data.rds`, `output/analysis_data.csv` (the same data, for the Data Explorer), `output/prep_log.csv` (step, n before, n after, reason) |
| `02_prevalence.R` | Reads `output/analysis_data.rds`, builds the plan's survey design, then overall, by sex and by age group with Korn–Graubard CIs, plus the unweighted overall | `output/prevalence.csv` |
| `report.qmd` (optional) | Short Quarto report that reads every number from `output/` | `reports/report.html` |
| `tests/testthat/test-prepare.R` | Unique `SEQN`; n = 6,084; no 7 or 9 codes in the derived BPQ variables; every row adult, examined and not pregnant; mean SBP within the raw range | – |
| `tests/run_checks.R` | Runs the tests on `output/analysis_data.rds`, or on another `.rds` file given as an argument | – |

R uses tidyverse (with `haven`), `here`, `survey` and `testthat`.

`instructor/part2-answer-key/` holds only what the page builds in `.claude/`: `settings.json` with the `Read(./data/restricted/**)` deny rule, and `skills/check-data/SKILL.md` (the page's example skill), plus a `README.md`.

### How to run the solutions

Always run them in a **copy** of the starter project, never inside `materials/`, so the participant zip stays clean.

1. Copy `materials/nhanes-bp/` somewhere outside this repo (or unzip `docs/downloads/nhanes-bp.zip`).
2. Copy `instructor/solutions/R/01_prepare.R` and `02_prevalence.R` into its `R/` folder, `report.qmd` into `reports/`, and the `tests/` folder into the project root.
3. From the project folder, run:
   ```
   Rscript R/01_prepare.R
   Rscript R/02_prevalence.R
   Rscript tests/run_checks.R
   quarto render reports/report.qmd
   ```
   Or open the folder in Positron and source each script in order.
4. Check the n flow in `output/prep_log.csv` (8,153 → 6,337 → 6,123 → 6,084) and `output/prevalence.csv` against the key results above.

The scripts use `here::i_am()`, so they find the project root from the project folder or any folder inside it.

**Show the tests failing, then passing.** Save an unprepared merge (the raw files joined on `SEQN`, no filters or recodes: 11,933 rows, children included, codes 7 and 9 still present), then point the tests at it:

```
Rscript -e 'library(haven); library(dplyr); rx <- function(f) read_xpt(file.path("data/raw", paste0(f, ".xpt"))); saveRDS(rx("DEMO_L") |> left_join(rx("BPXO_L"), by = "SEQN") |> left_join(rx("BPQ_L"), by = "SEQN"), "output/raw_merge.rds")'
Rscript tests/run_checks.R output/raw_merge.rds   # should FAIL
Rscript tests/run_checks.R                        # should PASS
```

Participants' own tests, written by Claude in class, may switch files differently; rehearse the page's test-first prompt and note how Claude does it.

### The checkpoint zip

`scripts/build_downloads.py` builds `docs/downloads/nhanes-bp-checkpoint.zip` at render time: the starter project plus `instructor/solutions/R/01_prepare.R` in `R/`. It unzips to `nhanes-bp/`. It has no outputs, no `.claude/settings.json` and no git, so people who switch to it unzip to a different folder or rename the old one first, re-add the deny rule, redo the Start version control prompt (git init and first commit), and run `source("R/01_prepare.R")` in the Console. It holds the prepare script only, so the estimate and verification steps are still real work. The repo is public, so the solutions are visible anyway.

Before class, unzip it into a scratch folder and check that `01_prepare.R` runs and ends at 6,084.

### Using the solutions as a demo fallback

If a live demo fails (an outage, a sign-in problem, or Claude going down a bad path):

1. Say so plainly: "Here's what this produced when we ran it earlier."
2. Open the tags folder at `checkpoint` or `complete` in Positron. Walk through `01_prepare.R` and `output/prep_log.csv`, and point out each decision from the plan (the skip rule, the `%in%` pregnancy filter, the exam weight).
3. Open `output/analysis_data.csv` in the Data Explorer and trace `SEQN` 130380.
4. Show `output/prevalence.csv` and compare it with Data Brief 511.
5. Use the "Why decisions matter" table to make the verification point.

If Claude's live output differs from the answer key, that's a teaching moment, not a failure. Compare the n's first.

## Terms of use (NHANES)

- **Public domain, with attribution.** CDC's page on using agency materials (https://www.cdc.gov/other/agencymaterials.html) says most CDC information is in the public domain and may be used and reproduced without permission, with attribution to CDC. The files ship unmodified in the zip with the attribution "Source: CDC/NCHS, National Health and Nutrition Examination Survey, August 2021–August 2023." Check the page's exact wording before quoting it.
- **NCHS data user agreement** (https://www.cdc.gov/nchs/policy/data-user-agreement.html, page dated September 17, 2024). Users must:
  - "Use the data in this dataset for statistical reporting and analysis only."
  - "Make no attempt to learn the identity of any person…"
  - "not link this dataset with individually identifiable data."

  Willful disclosure is a class E felony. The agreement says nothing about AI tools or redistribution. Don't claim it approves using AI; say that the class uses public-use, de-identified files for statistical analysis only, and follows Yale's policy (`[Yale data classification / policy link]`).
- **In class:** never ask Claude to identify anyone or to link files. Top-coding (age 80) and the masked variance units are privacy protections; say so when they come up. Other "public" datasets may restrict AI tools: check each one's terms before using it with Claude.

**Why NHANES:** it's real, public domain, keeps the blood-pressure theme, has real judgment calls (skip logic, 7/9 codes, weights), and has a published CDC benchmark with code to check against. The runner-up was `medicaldata::opt` (a real RCT), but it's off-theme and its source limits it to teaching.

## Refreshing the NHANES files

The files in `materials/nhanes-bp/` were downloaded on 2026-11-10 from:

- `https://wwwn.cdc.gov/Nchs/Data/Nhanes/Public/2021/DataFiles/DEMO_L.xpt`
- `https://wwwn.cdc.gov/Nchs/Data/Nhanes/Public/2021/DataFiles/BPXO_L.xpt`
- `https://wwwn.cdc.gov/Nchs/Data/Nhanes/Public/2021/DataFiles/BPQ_L.xpt`
- Codebooks: the same folder, with `.htm` instead of `.xpt`
- CDC's Data Brief 511 code: `https://wwwn.cdc.gov/Nchs/data/Tutorials/Code/DB511_SUDAAN.sas` (Latin-1 with CRLF line endings; convert to UTF-8 for the `legacy/` excerpt)

SHA-256 on 2026-11-10 (also in `data/raw/README.md`):

| File | SHA-256 |
|---|---|
| `DEMO_L.xpt` | `ca4374a158b493b8b0163e1388da21d57a18d1b9cecff2aa4e2fa2bec494fe23` |
| `BPXO_L.xpt` | `189aa9bed689d2c69cf8d780b01de85073276fea5694dd52cdf696229f9054a6` |
| `BPQ_L.xpt` | `0acde3af0526c375942fe0735e3bf69a0422bcbc606f98a478209d2f47baa4b5` |

**To check for a CDC revision** before each run of the class:

```bash
mkdir -p ~/nhanes-check && cd ~/nhanes-check
for f in DEMO_L BPXO_L BPQ_L; do
  curl -fsSLO "https://wwwn.cdc.gov/Nchs/Data/Nhanes/Public/2021/DataFiles/$f.xpt"
done
shasum -a 256 *.xpt     # compare with the table above
```

If the checksums match, there's nothing to do. If one differs, CDC revised the file: read the codebook's notes for what changed, copy the new files into `materials/nhanes-bp/data/raw/` (and the codebooks into `docs/codebooks/`), update the checksums and download date in `data/raw/README.md` and here, re-run the solutions, and update the answer key, the analysis plan's n flow, and the class page's numbers together. Never edit the files by hand. Shipping them in the zip means class doesn't depend on CDC's site (CDC data pages went offline for a time in early 2025).
