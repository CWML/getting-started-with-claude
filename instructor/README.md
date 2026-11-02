# Instructor materials

Everything here is for the instructor: the dataset spec, the script that generates the data, and the answer keys. Participants only download what's in `materials/` (the Part 1 kits and the Part 2 practice project). **All data are synthetic.** The one exception is the Kit A article, a real open-access paper that keeps its own license.

| Path | What it is |
|---|---|
| `README.md` | This file: Part 1 instructor prep (checklist, workspace check, private run-of-show details, segment notes, kit answer keys, backup plans, 90-minute add-backs), dataset spec, Part 2 answer keys, extra project files, real-dataset ideas, and how to regenerate the data |
| `make_data.R` | Generates the class cohort and the Part 2 REDCap exports (seeded, so the output is the same every time) |
| `solutions/R/`, `solutions/python/` | Answer key and demo fallback for the Part 2 build segment: `01_clean` … `04_figure` and `report.qmd` |
| `part2-answer-key/` | Part 2 answer key: example `.claude/` folder (settings, command, skill, subagent, hooks), tests, and `CLAUDE.md` additions |

## Part 1: instructor prep

Teach from the class page, `https://cwml.github.io/getting-started-with-claude/part1.html`, on the projector. Participants follow the same page on their own screens (QR code at the top), where they copy prompts, download the kits, and find the take-home material. The reference page, `part1-reference.html`, holds the detail that doesn't fit in class. Keep this guide open on a second screen or printed: the segment notes below give the timing and what to say for each part.

The class page is public, so instructor notes and demo account details live in this file only, never in `part1.qmd`.

Claude's features, menu names and admin settings change often. The feature descriptions were checked against the Claude Help Center (support.claude.com) and the Claude Code docs on October 30, 2026. When you re-check them, update the date and the corrections log in `about.qmd`.

**Prep checklist**

- [ ] Replace every `[bracketed placeholder]` in `part1.qmd`, `part1-reference.qmd`, `index.qmd` and `materials/part1-kits/` (HIPAA-version request link, policy links, HSIT/ITS contacts, Copilot names, site URL). The list below groups them by who can answer.
- [ ] Registration form asks: kit choice (Kit A Article Explainer or Kit B Committee Assistant), Claude tier (standard, premium, HIPAA-supported) and Claude Code access, and appointment (Yale, YNHHS, or both).
- [ ] Line up a co-facilitator for the first 3 minutes (sign-in) and the build block (0:17 – 0:26). Strongly recommended for 18 people.
- [ ] 2–5 days before class, send the sign-in check email: the setup page (`index.html#setup-part1`), "sign in to Claude in a browser and open a new chat," the kit choice, the optional phone app install (with the device policy note), and the "no working account?" section (`index.html#access`).
- [ ] Run the check-in-both-workspaces list below the week before, with screenshots.
- [ ] Take a fresh pre-run screenshot of a fabricated PMID: in a demo chat, ask for references on the Kit A topic, find one whose PMID doesn't match in PubMed, and keep the chat open for segment 2. Repeat until you get one.
- [ ] Pre-run the Kit A Turn 1 chat (with your answers to Claude's questions) for segment 7, "Anatomy of a strong prompt."
- [ ] Build the demo Projects ("Article Explainer"; optionally "Committee Assistant") in the demo account, and share them **Can view** with participants (if sharing is enabled). This is the fallback when uploads fail.
- [ ] Test phone mirroring on the SHM L 111 projector (iPhone Mirroring or QuickTime). Check that the demo Project has synced to the phone app.
- [ ] Clear old demo chats and set the demo account's memory the way you'll teach it, so earlier sessions don't leak into the live demo.
- [ ] Rehearse from the class page with the segment notes below to check the timing.
- [ ] Take backup screenshots: both settings layouts, each Project build step, the model menu, the "+" and "/" menus, Customize > Skills, the Word handout, the phone app and its Code tab.
- [ ] Print green cards, one per seat.
- [ ] On the published GitHub Pages site, open the kit `.md` links from segment 9 (the article and the committee pack) and check that they show as plain text in the browser and don't download. If they download, tell people to open the file in TextEdit or Notepad instead.

**Placeholders by who can answer** (as of October 31, 2026; site pages only)

Prompt slots such as `[audience]`, `[role]`, `[topic]`, `[committee name]` and `[general knowledge]` are meant for participants. Leave them alone. To find what's left, search the site files for `[`.

| Who | Placeholders | Where |
|---|---|---|
| You / the library | Owner `[name]`, `[owner email]`, footer `[contact]`, features-checked `[date]`, `[instructor]`, `[Instructor name]`, `[Library name]`; `[QR code]` at the top of the class page | `_quarto.yml`, `part1.qmd`, `part2-slides.qmd`, `about.qmd`, `index.qmd`, kits `README.md` |
| You / the library | Forms: `[registration link]`, `[exit-ticket form link]`, `[feedback form link]`, `[link to short evaluation form]` | `index.qmd`, `part1.qmd`, `part1-reference.qmd`, `part2.qmd`, `part2-slides.qmd` |
| You / the library | Services: `[office hours link]`, `[library consult link]`, `[literature search consults…]`, `[library evidence synthesis service]`, `[data services consults…]`, `[AIR Tracks B–F offerings]`, `[AIR SIG channel / Teams]` | `index.qmd`, `part1.qmd`, `part1-reference.qmd`, `part2.qmd`, `part2-slides.qmd` |
| You / the library | Guidance: `[library license guidance]`, `[link to library guidance on AI disclosure]`, `[Dated source on AI energy use, chosen by a librarian.]`, `[All of Us workshop site link]`, `[add category]` (Part 2 form) | `part1.qmd`, `part1-reference.qmd`, kits `README.md`, `part2.qmd`, `about.qmd`, `part2-description.md` |
| ITS | `[sign-up link]`, `[eligibility…]`, `[who has a license / how to request]`, `[sign-in steps / SSO note]`, `[confirm Yale seat tiers]` (Fable on standard seats), `[Yale retention period…]`, `[whether Yale's agreement allows chats to be used to train models…]`, `[one-line description from ITS]`, `[product name — check]`, `[confirm with ITS which Claude Code surfaces are covered]`, `[ITS contact]`, `[ITS / help contact]`, `[HSIT / ITS AI help]`, `[link to current install instructions]`, `[local guidance for Windows users]`, `[mobile device policy]`, `[how to check / who to ask]` | `index.qmd`, `part1.qmd`, `part1-reference.qmd`, `part2.qmd`, `cheatsheet.qmd` |
| HSIT / HIPAA Privacy Office | `[request link]` (HIPAA-supported version), `[HSIT / HIPAA Privacy Office contact]`, `[Yale data classification / policy link]`, `[Yale data classification names…]`, the six `[approved data: ___, confirmed by ___ on DATE]` cells and four `[classification, confirmed by HSIT on DATE]` cells, `[Yale AI Tool Registry]`, `[link to institutional AI and data policy]`, `[Insert local policy]` | `index.qmd`, `part1.qmd`, `part1-reference.qmd`, `part2.qmd`, `part2-slides.qmd`, `cheatsheet.qmd` |
| YNHHS | `[approved tool, e.g. Microsoft Copilot: link, confirmed by ___ on DATE]`, `[YNHHS-approved chat AI…]`, `[YNHHS AI governance link, confirmed DATE]`, whether YNHHS-primary appointees can use Clarity (`[confirm]`) | `index.qmd`, `part1.qmd`, `part1-reference.qmd` |
| Check in Copilot yourself | `[Copilot Notebook or Agent — check the name]`, `[Notebook or agent instructions — check]`, `[Copilot model or "think deeper" option — check]`, `[Copilot memory and personalization settings — check]`, `[Microsoft 365 Copilot app — check]`, `[Clarity equivalent — check]`, `[check limits]` | `part1-reference.qmd` (Copilot section) |
| Research integrity / teaching | `[HSARG]`, `[Office of Research Integrity]`, `[Poorvu Center / ETI AI teaching guidance]`, `[teaching-center AI guidance]`, `[links to other funder notices]`, `[accessibility contact]` | `part1.qmd`, `part1-reference.qmd`, `index.qmd` |
| Week-before workspace check | The two settings screenshots, `[pre-run citation]`, `[Record results here]` (Part 2) | `part1-reference.qmd`, `part1.qmd`, `part2.qmd` |

**Check in both Yale workspaces (standard enterprise and HIPAA-supported) the week before, with screenshots**

- [ ] The Settings > Your Claude path (older layout: Settings > Memory) and the toggle names: Include sensitive topics in memory, Memory from chats (older: Generate memory from chats), Search and reference chats. + > Memory must be set before the first message.
- [ ] The Project's "Use account memory" label, and whether there's a way to add typed text to a Project (the "add text" fallback is unverified).
- [ ] Model names and effort levels in the menu next to Send, and whether Fable is available on standard seats [confirm Yale tiers].
- [ ] Incognito retention [30 days by default or Yale's setting], and that files and skills don't run in incognito.
- [ ] Whether skills, code execution and file creation are on, and their HIPAA coverage ("available but not covered" if an Owner turns them back on).
- [ ] Sharing: Can view / Can edit, and whether it's limited to Yale.
- [ ] The "+" menu, and what appears when you type "/" in a new chat (skills, connectors, styles as `/name-style`). Teach only what you see.
- [ ] Projects visible in the phone app, the mobile app in the HIPAA-supported workspace, and whether the phone app has a Code tab.
- [ ] /rc (Remote Control) status in the HIPAA configuration (expected off).
- [ ] The Cowork layout (built into Enterprise chat since Oct 23, 2026, if enabled; the HIPAA workspace keeps the older layout).
- [ ] The Copilot feature names for the "Do this in Copilot" path.
- [ ] The Hickey article: the license version on the PMC page, and whether the full text explains 98 vs 99.
- [ ] Org usage headroom for 18 people running multi-part prompts.

**Run of show: private details**

- **Demo account:** `[demo account name]`, signed in on the presenter laptop (second browser tab, finished Article Explainer Project open) and the demo phone. Two pre-run chats ready: a plausible-looking fabricated reference (segment 2, with a screenshot as backup) and Turn 1 with Claude's questions answered (segment 7). Don't teach from a personal account.
- **Green cards:** one per seat. Up at 0:03 = signed in with a new chat open. Up at the 0:25 checkpoint = Claude named your kit's files (both for Kit A, the one for Kit B) and quoted one rule. The co-facilitator goes to anyone without a green card. Move on at 0:26 regardless; people catch up during Turn 1.
- **Timing anchors:** build starts 0:17; checkpoint 0:25; verification starts 0:37 and is never cut.
- **Cut order if running late:** the phone tryout becomes a 1-minute demo (saves 3); Cowork moves onto the exit slide (saves 1–2); the skill becomes a screenshot (saves 1); the PubMed opening moves into segment 9 (saves 2); the / menu becomes an instructor show (saves ~0.5).

**Segment notes**

Teaching notes for each part of the class page, in order. They used to appear on the page as collapsed Instructor tips.

*1. Welcome and sign in (0:00 – 0:03)*

**0:00 (3 min).** Put this section on screen as people arrive. Watch for green cards. Anyone without a working account pairs as navigator with someone who has one, or follows the [Copilot] path on the site. Personal accounts are fine for the public class files only, and nobody signs up during class.

**Cut order if you run late** (verification is never cut, and it starts before anything that can be cut):

1. Phone tryout becomes a 1-minute instructor demo (saves 3 min).
2. Cowork moves into the exit ticket (saves 1–2).
3. The skill demo becomes a screenshot (saves 1).
4. The PubMed opening moves into segment 9 (saves 2).
5. The / menu becomes an instructor show (saves ~0.5).

*1. Welcome and sign in (0:00 – 0:03) › By the end of this class, you'll be able to*

Don't read the list. Say it as one sentence: "Pick the right tool, build a Project, prompt it well, check what comes out."

Disclose your own AI use in 15 seconds: "These materials were drafted with Claude and Claude Code, and checked by me." That models the disclosure habit we cover in segment 9.

*1. Welcome and sign in (0:00 – 0:03) › Today*

About half the class is hands-on. Point out the pattern: you watch once, then you do it yourself.

*1. Welcome and sign in (0:00 – 0:03) › No working account?*

Keep this to 20 seconds. Nobody signs up for anything during class. Point YNHHS-primary people to the [Copilot] tab on the reference page; the kit files and prompts work there too.

*2. Why we check (0:03 – 0:05)*

**0:03 (2 min).** Cut option: if you're late, move this demo into segment 9 (saves 2 min).

*2. Why we check (0:03 – 0:05) › Watch: does this reference exist?*

Open the pre-run chat and do the lookup live. If the network fails, show the screenshot. The point: a reference can look perfect and still be wrong. This also guarantees segment 9 has at least one fabricated example, even if everyone's Claude behaves well today.

*3. Which tool for which data (0:05 – 0:11)*

**0:05 (6 min):** 2 min on the decision table, 3 min on "Can I share this?", 1 min on "Not here."

*3. Which tool for which data (0:05 – 0:11) › Which tool for which data?*

Say plainly: "A HIPAA-supported version of Claude is available by request." Then the caveats: it doesn't approve your project, every feature, or every data set. Follow [Yale data classification / policy link]. Questions go to [HSIT / HIPAA Privacy Office contact]. Never suggest that the standard account covers PHI.

Features in the HIPAA-supported version may differ: some are off, and it keeps an older layout. Check with [ITS]. Full table and dated feature list: the [Quick reference](part1-reference.qmd#tool-data).

*3. Which tool for which data (0:05 – 0:11) › Can I share this?*

**0:07 (3 min).** Take hands for each, one or two comments, move on.

1. **OK.** Public and openly licensed.
2. **OK.** Your own work, as long as it has no student names or records.
3. **No** (or check first). Removing a name isn't de-identification. Only in a tool approved for PHI, and only if your project is approved.
4. **No.** Reviewers must keep applications confidential, and NIH prohibits generative AI in peer review (NOT-OD-23-149).
5. **Check first.** It belongs to YNHHS, so YNHHS rules apply. Use [Copilot] for YNHHS work unless YNHHS has approved otherwise.
6. **Check first.** The license may not allow uploading to AI tools. Use the open-access version or check [library license guidance].

Full answers: [Quick reference](part1-reference.qmd#tool-data).

*3. Which tool for which data (0:05 – 0:11) › "Not here" is a valid answer*

**0:10 (1 min).** "Choosing not to use AI is a skill too."

*4. Lock your settings (0:11 – 0:15)*

**0:11 (4 min):** 1 min watch, 3 min do.

*4. Lock your settings (0:11 – 0:15) › Watch, then do: memory settings*

Show it once on your screen, then let people do it. Have screenshots of both layouts ready: the combined chat-and-Cowork layout, and the older layout that the HIPAA-supported version keeps.

"Include sensitive topics" is off by default, so this is a check, not a change. On Enterprise accounts, memory is off for each person until they turn it on, so many people will find it already off. The older layout calls it "Generate memory from chats."

Worth one sentence: deleting a chat doesn't delete memories made from it.

*4. Lock your settings (0:11 – 0:15) › Incognito: what it does and doesn't do*

**20-second poll:** "A sensitive HR email: Project, incognito, or neither?" Answer: neither. Use the tool approved for that data. Incognito doesn't make anything allowed.

Details for the page: [Quick reference: settings and privacy](part1-reference.qmd#settings).

*5. Watch: build a Project (0:15 – 0:17) › Five steps*

**0:15 (2 min).** Do it once at normal speed on the demo account. Point out the **Share** button (Can view / Can edit, if enabled), but don't stop on it.

"Use account memory" keeps this Project's memory separate from the rest of your chats. Check the label before class.

*6. Your turn: build your Project (0:17 – 0:26)*

**0:17 (9 min):** 8 min build, 1 min checkpoint. At 0:25, ask for green cards. Move on at 0:26 regardless; anyone still building catches up during Turn 1.

*6. Your turn: build your Project (0:17 – 0:26) › Your turn: build it*

Walk the room. Most common problems: the file landed in a regular chat instead of the Project, or the instructions weren't saved.

If an upload fails: paste the style guide's text at the end of the project instructions, and paste the article (Kit A) or committee pack (Kit B) into the first message of the Project chat. Or open the instructor's shared Project (Can view, if sharing is enabled). Check before class whether the Project has an "add text" option.

Windows users who get `.md.txt` files: the fix is on the setup page.

*6. Your turn: build your Project (0:17 – 0:26) › Your kit*

Say out loud: the privacy line in the Project instructions is advice, not enforcement. Claude will usually follow it, but nothing stops a paste. Part 2 shows tools that actually block things.

*7. Watch: anatomy of a strong prompt (0:26 – 0:28) › What each part does*

**0:26 (2 min).** Show the pre-run Turn 1 chat (a live ask-first round trip won't fit in 2 minutes). Point to Claude's questions, then to the "Where this came from" table: it turns checking into a 2-minute Ctrl-F job.

All six prompting patterns, with examples: [Quick reference: prompt library](part1-reference.qmd#prompt-library).

*8. Your turn: run it, then push back (0:28 – 0:37)*

**0:28 (9 min):** 8 min hands-on, 1 min pair debrief. Default model and effort avoid usage limits.

*8. Your turn: run it, then push back (0:28 – 0:37) › Your turn: Turn 1*

Anyone stuck on Claude's questions can use the fast answers on the class page. Walk the room. If someone's Claude skips the questions, that's a teaching moment: point to the "Wait" line and have them reply "Please ask your questions first."

*8. Your turn: run it, then push back (0:28 – 0:37) › Your turn: push back (Turn 2)*

**0:36 (1 min).** Pair debrief, then take one answer from the room. Key message: treat the first answer as a draft; much of the value comes from the second turn.

*9. Verify before you use it (0:37 – 0:46)*

**0:37 (9 min). Don't cut this segment.** 1 min demo, 6 min hands-on, 2 min talk. It starts before every segment that can be cut.

*9. Verify before you use it (0:37 – 0:46) › Your turn: check quotes and rules*

Demo one quote check on your screen first (1 min), then let people go.

The bonus: the abstract says 98 people enrolled in the telehealth arm, then reports week-24 blood pressure for "96/99 intervention." Ask: "Did anyone's Claude repeat 99 without noticing that 98 were enrolled? Did anyone's Claude flag it?" Either answer is a good discussion.

The article has two more inconsistencies: the week-48 confidence interval (abstract: 95% CI [30%, 53%]; Results: [14%, 38%], which repeats the week-24 interval) and the share of women (abstract 67%, Results 70%, 139/200). A quote can be "exact" and still be wrong. If someone's explainer cites the week-48 CI, ask which section it came from.

*9. Verify before you use it (0:37 – 0:46) › Your turn: check a citation (Turn 3)*

If web search is on, Claude may return real studies. Frame it as: "Declining or labeling is the behavior you want, and you still check." The pre-run example from segment 2 guarantees the room has seen at least one fabricated reference.

*9. Verify before you use it (0:37 – 0:46) › Your turn: add one rule*

**0:43.** This is the second Create moment: their Project now has their own verification rule in it.

*9. Verify before you use it (0:37 – 0:46) › You're accountable for what you use*

**0:44 (2 min).** Talk only. If anything went wrong in the room today, use it as the example.

Disclosure template, notice dates, and red flags for fabrication and bias: [Quick reference: verify and disclose](part1-reference.qmd#verify-disclose). Library evidence synthesis service: [link].

*10. Tune it: model, effort and skills (0:46 – 0:51)*

**0:46 (5 min):** 1.5 min demo, 3.5 min hands-on. Cut options: show the skill as a screenshot instead of live (saves 1 min); the / menu becomes an instructor show (saves ~0.5 min).

*10. Tune it: model, effort and skills (0:46 – 0:51) › Watch: the model menu*

Open the menu on screen. Current models (check the menu before class): Fable 5.1, Opus 5.5, Sonnet 5.5, Haiku 5.5, with older ones under "More models." Effort levels: Low, Medium, High, Extra high, Max; each model marks its recommended level "Default."

Fable may need usage credits on a standard seat [confirm Yale seat tiers]. More: [Quick reference: model, effort and commands](part1-reference.qmd#model-effort-commands).

*10. Tune it: model, effort and skills (0:46 – 0:51) › Your turn: same task, smaller dial*

Switch back to the default afterward if you plan to keep working.

*10. Tune it: model, effort and skills (0:46 – 0:51) › The **+** and **/** menus*

Before class, type "/" in a new chat in both Yale workspaces and screenshot what appears (skills, connectors, styles). Show only what exists there. Styles are being folded into skills; a migrated style may show up as `/name-style`. Mention that only if someone asks.

*10. Tune it: model, effort and skills (0:46 – 0:51) › Watch: a skill makes a Word handout*

Run it on the demo account, then open Customize > Skills. Participants can try it as a stretch goal if their workspace allows it.

Caveats: skills need **Create and edit files** (Settings > Capabilities; older label "Code execution and file creation"). They don't work in incognito chats. In the HIPAA-supported version, skills are off by default and not covered if re-enabled [confirm with ITS]. Uploading your own skill: [Quick reference: Projects and skills](part1-reference.qmd#projects-skills).

*11. Take it with you: the phone app (0:51 – 0:55)*

**0:51 (4 min):** 2 min demo, 2 min optional tryout. Cut option: make this a 1-minute demo with no tryout (saves 3 min).

*11. Take it with you: the phone app (0:51 – 0:55) › Watch, then try: your Project on your phone*

Mirror the phone (iPhone Mirroring or QuickTime). Use the dictation mic for the question. Point out voice mode (beta, the sound-wave icon next to the mic) without running it. Check before class that Projects appear in the phone app for both workspaces.

*11. Take it with you: the phone app (0:51 – 0:55) › Phone rules*

Bridge sentence: "This app has a Code tab. In Part 2, /rc connects it to a Claude Code session on your laptop (if your organization has turned on Remote Control)."

*12. Cowork and the bridge to Part 2 (0:55 – 0:57)*

**0:55 (2 min). Talk only.** Cut option: fold Cowork into the exit ticket as one line (saves 1–2 min).

*12. Cowork and the bridge to Part 2 (0:55 – 0:57) › Cowork in 30 seconds*

Don't demo. Claude in Chrome (if enabled) is Cowork in your browser: same cautions. More: [Quick reference: Cowork](part1-reference.qmd#cowork).

*12. Cowork and the bridge to Part 2 (0:55 – 0:57) › From today to Part 2*

One sentence: "Everything you did today has a twin in Part 2, but there it works on files and code on your own computer." Part 1 is recommended, not required, for Part 2.

*13. Exit ticket and close (0:57 – 1:00) › Exit ticket*

**0:57 (3 min).** Take one answer per question, then show "Where to go next" and the feedback link. End on time.

*Where to go next*

Leave this section on screen while people pack up.

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
| A participant has no working account | Pair them as navigator with a neighbor. YNHHS-primary or no-seat participants use the "Do this in [Copilot]" path on the class page. No sign-ups during class; personal accounts are for the public class files only. |
| Uploads fail | Paste the file text into the Project instructions, or open the instructor's shared Project (Can view, if enabled). |
| Claude outage or Wi-Fi down | Teach from your screen and the backup screenshots. Participants build their Project after class from `part1.html`. |
| A setting or menu is missing for some people | Say it depends on the workspace or admin settings, show it on your screen, and move on. |
| The live PubMed lookup in segment 2 fails | Show the fabricated-PMID screenshot. |
| Phone mirroring fails | Show the phone screenshots and say it in one sentence; use the cut order. |
| Skills or file creation are off | Show the Word handout screenshot and Customize > Skills on your screen. |
| Windows downloads the kit files as `.md.txt` | Point to the troubleshooting note on the setup page; the files still upload. |

**If Part 1 grows to 90 minutes**

Add these back in order, up to 30 minutes in total. Update the agenda table, the segment headings and the notes in `part1.qmd`, and the duration in `part1-description.md`.

1. A participant skill hands-on: the Word handout, or uploading a custom skill (if skills, code execution and file creation are enabled).
2. A longer phone segment: everyone opens their Project on the phone app and tries dictation.
3. The Research or PubMed connector demo (if enabled).

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
