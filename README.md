# Claude & Claude Code  Workshop Materials

Materials for two medical library classes:

- **Part 1: Getting started with Claude** (60 minutes; Track A Foundations · Beginner). A hands-on Project workshop in the Claude app for anyone at the School of Medicine. Every participant builds one Project from a class kit (Kit A Article Explainer or Kit B Committee Assistant), runs one multi-part prompt, and checks the answer against the source. It also covers important settings (memory, incognito), the app's model/effort menu, "+" and "/" menu, skills, and the phone app, and names the Claude Code equivalents as a bridge to Part 2. No coding, no data work.
- **Part 2: Analyzing research data with Claude Code** (90 minutes; Track C Computational Research · Intermediate). Claude Code in Positron or VS Code (extension first): project setup and data rules, plan → build → verify on a synthetic trial dataset, models and effort, skills/commands/subagents, Remote Control, and research integrity.

The repo is a [Quarto](https://quarto.org) website. Participants use the published site; instructors use the repo.

## Repo layout

```
index.qmd                  # home page, participant setup, access and alternatives, recommended links
part1.qmd                  # Part 1 class page, taught from directly (no deck)
part1-reference.qmd        # Part 1 quick reference page
part2.qmd                  # Part 2 class page you teach from; participants follow along
part2-slides.qmd           # Part 2 slides (press S for speaker notes)
cheatsheet.qmd             # Claude Code cheat sheet (Part 2)
part1-description.md       # Part 1 entry for the library's training request form (not rendered)
part2-description.md       # Part 2 entry for the library's training request form (not rendered)
materials/part1-kits/      # Part 1 Project kits: Kit A (Article Explainer), Kit B (Committee Assistant)
materials/hypertension-cohort/  # the Part 2 practice project (zipped at build time)
theme/                     # CWML web style adapter: cwml.scss, cwml-dark.scss, cwml-reveal.scss (Part 2 deck), skip-link.html
instructor/                # not rendered: README (Part 1 prep and answer keys, data spec, Part 2 answer keys), make_data.R, solutions, Part 2 answer key, review-outline.md (checklist for reviewing the materials)
scripts/build_downloads.py # post-render step that builds the zip downloads
```

## Build and preview

```bash
quarto preview        # live preview while editing
quarto render         # build the site into docs/ (stop quarto preview first)
```

The site pages contain no executable code, so rendering doesn't need R or Python packages (just Python 3 for the post-render zip step).

What the render does:

- **Part 1 has no deck:** instructors teach from the class page, `part1.html`. The page is public, so the teaching notes live in `instructor/README.md`.
- **Zip downloads:** `scripts/build_downloads.py` builds `downloads/hypertension-cohort.zip` (Part 2) and `downloads/part1-kit-a.zip` and `downloads/part1-kit-b.zip` (Part 1). The kit files are also copied to the site as single files.
- **Theme:** pages and decks use the CWML web style (draft 0.1) through the Quarto adapter in `theme/`. Dark mode (`cwml-dark.scss`) is a local extension that isn't part of CWML 0.1; the site follows the reader's system setting and has a light/dark toggle.

## Publish to GitHub Pages

The live site is <https://cwml.github.io/getting-started-with-claude/>. GitHub Pages serves the `docs/` folder on `main` (**Settings → Pages → Deploy from a branch → `main` / `/docs`**).

1. Stop `quarto preview`, then run `quarto render`.
2. Commit the source changes and `docs/` together, and push to `main`.
3. Wait a minute or two, then hard-refresh the site (Cmd + Shift + R).

`docs/` is generated: never edit it by hand.

## Before each class

- Check every `[bracketed placeholder]` (sign-up and HIPAA-version request links, policy links, contacts, enabled connectors).
- Check the Claude and Claude Code features against both Yale workspaces (standard enterprise and HIPAA-supported), since they change often.
- Follow the instructor prep checklist: both parts are in `instructor/README.md`.
- After re-checking features, update the "Last checked" date at the top of `part1-reference.qmd`.

All class data and kit files are **synthetic**, apart from the open-access article in Kit A, which keeps its own license. See `instructor/README.md`.
