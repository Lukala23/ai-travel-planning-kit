# Setup and use in different AI agents

[中文版](agent-platforms.md)

> Last verified: 2026-08-14. Agent products change quickly. If a screen, path, or command has changed, use the official links in this guide and open an issue to update the repository.

**AI Travel Planning Kit** uses a standard `SKILL.md` plus rule files that load only when relevant. Products do not all install Skills the way Codex does.

This repository supports three modes:

1. **Native Skill**: the product discovers `SKILL.md`, invokes it automatically or manually, and reads modules by task;
2. **Workspace rules**: place the Skill in one travel project's rules or Skills directory;
3. **File upload / reference**: upload the core files and relevant modules when the product lacks complete Skill support.

English users should install `plan-reliable-trips-en`. Chinese users should install `plan-reliable-trips`. Installing both is possible, but enabling only the language you use saves context and avoids ambiguous invocation.

## Download

```bash
git clone https://github.com/Lukala23/ai-travel-planning-kit.git
cd ai-travel-planning-kit
```

Without Git, choose `Code → Download ZIP` on GitHub. For local Skill upload, download `plan-reliable-trips-en-skill.zip` from [Releases](https://github.com/Lukala23/ai-travel-planning-kit/releases/latest). For an AI that accepts documents but not Skills, upload `ai-travel-planning-kit-portable-core.en.md` first and then add the relevant scenario pack.

The English Skill directory is:

```text
skill/plan-reliable-trips-en/
├── SKILL.md
├── agents/openai.yaml
├── assets/
└── references/
```

## Platform quick reference

| Platform | Recommended setup | Invocation | Note |
|---|---|---|---|
| Codex | Personal Skill | `$plan-reliable-trips-en` | Personal Skills work across projects |
| TRAE | Import in SOLO or project `.trae/skills/` | “Use the plan-reliable-trips-en skill…” | TRAE's current community guide says Skills fully trigger in SOLO |
| WorkBuddy | Upload the Release Skill ZIP | Describe the trip in a task | Confirm the Skill is enabled; workspace files are a fallback |
| Claude Code | Personal or project Skill | `/plan-reliable-trips-en` or natural-language trigger | Personal and project scopes differ |
| Cursor | Project/personal Skills or GitHub import | `/plan-reliable-trips-en` or natural language | `.cursor/skills` and `.agents/skills` are supported locations |
| Windsurf | Workspace or global Skill | `@plan-reliable-trips-en` or natural language | Prefer workspace scope for team sharing |
| GitHub Copilot | Repository or personal Agent Skill | Ask in Agent mode | Useful when travel plans live in a versioned repository |
| Gemini CLI | `gemini skills link` | Natural language; name it when needed | Confirm discovery and enablement in the CLI |
| Other chat AI | Upload Markdown files | Require it to read files first | Dynamic facts need manual input if browsing is unavailable |

## OpenAI Codex

OpenAI's current [Build skills](https://learn.chatgpt.com/docs/build-skills) documentation places personal Skills under `~/.agents/skills`, scans repository `.agents/skills` locations, and supports symlinked Skill folders. Some older or compatibility builds still read `~/.codex/skills`, but use the current official location for a new installation.

macOS / Linux:

```bash
mkdir -p ~/.agents/skills
ln -s "$PWD/skill/plan-reliable-trips-en" ~/.agents/skills/plan-reliable-trips-en
```

Compare or back up an existing destination before replacing it. Windows users can copy the complete folder into their personal Codex Skills directory.

This project disables implicit invocation in OpenAI metadata to avoid loading the full Skill during unrelated travel chat. Invoke it explicitly:

```text
Use $plan-reliable-trips-en.

Build a trip brief from my description and ask only questions that materially change the plan.
Destination: ...
Dates: ...
Travelers: ...
Budget: ...
Most important experience: ...
```

## TRAE

The [TRAE official Chinese community Skills guide](https://forum.trae.cn/t/topic/809) describes importing an existing Skill, using a GitHub Skill URL, or placing it under `.trae/skills/`. The current guide also states that Skills fully trigger in SOLO mode.

### Import from GitHub in SOLO

```text
https://github.com/Lukala23/ai-travel-planning-kit/tree/main/skill/plan-reliable-trips-en
```

If the current version cannot import a nested repository directory, use the English Release ZIP or the manual project method.

### Project method

Copy `skill/plan-reliable-trips-en` to:

```text
your-travel-project/.trae/skills/plan-reliable-trips-en/
```

`SKILL.md` must be directly inside that final directory, not under a duplicated nested folder.

```text
Use the plan-reliable-trips-en skill. Research accommodation areas, core
experiences, and transport structure first. Wait for my key choices before
producing the complete itinerary.
```

## WorkBuddy

WorkBuddy's [local Skill guide](https://www.workbuddy.cn/docs/workbuddy/From-Beginner-to-Expert-Guide/Function-Description/Skills-Market) provides an Add Skill → Upload Skill flow. Its [task guide](https://www.workbuddy.cn/docs/workbuddy/Create-Task) also supports choosing a workspace, `@`-referencing rules or documents, and uploading files.

### Recommended: upload the package

1. Download `plan-reliable-trips-en-skill.zip` from [Releases](https://github.com/Lukala23/ai-travel-planning-kit/releases/latest).
2. Open the WorkBuddy Skills page.
3. Choose Add Skill → Upload Skill.
4. Upload the ZIP and confirm `AI Travel Planning Kit` is present and enabled.
5. Create a task with destination, dates, travelers, budget, and core goals.

Enable only Skills relevant to the task. Inspect the source, permissions, and scripts in any third-party Skill before installation. This travel Skill currently contains Markdown rules and a trip template only; it does not require credentials, payment data, or external execution permissions.

### Fallback: workspace files

1. Use the repository as the task workspace, or copy `skill/plan-reliable-trips-en` into your travel folder.
2. `@`-reference `SKILL.md`, its core rules, and the trip brief.
3. Require the AI to read them and conditionally load modules before planning.
4. Save the trip output separately; edit a specialist module only when you intentionally want to change toolkit behavior.

```text
Read @skill/plan-reliable-trips-en/SKILL.md and the core rules it references.
Then process this trip. Return the trip brief and key trade-offs before a full itinerary.
```

## Claude Code

Claude Code's [Skills documentation](https://code.claude.com/docs/en/slash-commands) describes personal Skills under `~/.claude/skills/<skill-name>/SKILL.md` and project Skills under `.claude/skills/<skill-name>/SKILL.md`.

```bash
mkdir -p ~/.claude/skills
ln -s "$PWD/skill/plan-reliable-trips-en" ~/.claude/skills/plan-reliable-trips-en
```

For one workspace, copy it to:

```text
travel-workspace/.claude/skills/plan-reliable-trips-en/
```

Invoke `/plan-reliable-trips-en`, or describe a matching trip request and allow automatic selection.

## Cursor

Cursor's [Agent Skills documentation](https://cursor.com/docs/skills) supports the open Agent Skills standard, project and personal locations, and GitHub import.

Project locations:

```text
travel-workspace/.cursor/skills/plan-reliable-trips-en/
travel-workspace/.agents/skills/plan-reliable-trips-en/
```

Personal locations:

```text
~/.cursor/skills/plan-reliable-trips-en/
~/.agents/skills/plan-reliable-trips-en/
```

You can also add the repository from Cursor's Rules settings. If remote import does not discover the nested directory, copy it manually. Invoke `/plan-reliable-trips-en` or say “Use AI Travel Planning Kit.”

## Windsurf

Windsurf's [Cascade Skills documentation](https://docs.windsurf.com/windsurf/cascade/skills) describes workspace and global Skill locations.

```text
travel-workspace/.windsurf/skills/plan-reliable-trips-en/
~/.codeium/windsurf/skills/plan-reliable-trips-en/
```

Confirm that `SKILL.md` is directly inside the final directory. Invoke `@plan-reliable-trips-en` or request the Skill in natural language.

## GitHub Copilot

GitHub's [About agent skills](https://docs.github.com/en/copilot/concepts/agents/about-agent-skills) describes repository Skills under supported paths such as `.github/skills` and `.agents/skills`, plus personal locations.

```text
your-travel-repository/.github/skills/plan-reliable-trips-en/
your-travel-repository/.agents/skills/plan-reliable-trips-en/
```

Ask for the trip in a Copilot experience that supports Agent Skills. If a particular interface supports only attachments or repository context, use the file-upload method below.

## Gemini CLI

Gemini CLI's [Using Agent Skills](https://geminicli.com/docs/cli/using-agent-skills/) supports user and workspace Skills plus install, link, enable, and disable commands.

```bash
gemini skills link "$PWD/skill/plan-reliable-trips-en"
```

For one workspace, `.gemini/skills/` or `.agents/skills/` can be used. Confirm discovery in the CLI before starting the trip request.

## Other file-capable AI tools

If the product lacks native Agent Skills, use the rules as planning context. Do not upload every specialist file by default.

### Provide first

Upload `ai-travel-planning-kit-portable-core.en.md` from the Release. It contains the router and two slim shared rules, not the complete brief or every specialist.

### Add a scenario delta

These files contain specialists only and do not repeat the router. Pair them with the core rather than uploading one alone.

| Task | Additional file |
|---|---|
| City candidates, daily route, researched lodging/dining, and public transport | `ai-travel-planning-kit-portable-city.en.md` |
| Air chain, international/cross-border/transit, and triggered health/insurance reminders | `ai-travel-planning-kit-portable-international.en.md` |
| Rental/self-drive, hiking/outdoor, and related health/insurance reminders | `ai-travel-planning-kit-portable-road-outdoor.en.md` |

For photography, museums, souvenirs, charters, or formal package rules absent from a scenario pack, add the individual `references/*.md` from the Skill archive only when triggered. The full `ai-travel-planning-kit-portable.en.md` is backward-compatible archive, not the default context. Add the advanced trip brief only when completed or genuinely useful for a complex task.

```text
Follow the uploaded core rules and use only modules needed for my current question.
Extract necessary conditions from natural language, keep unknowns unknown, and do
not inherit another trip. Do the smallest sufficient research and expand into a
complete plan or formal files only when I explicitly ask.
```

Without browsing, require a “to verify” list and the types of official sources to open. Do not let stale model knowledge become a current fact.

## Installation test

```text
Confirm whether you have read the plan-reliable-trips-en Skill.
I will tell you only: “Two people are going to Nepal next spring.” Do not build
an itinerary. Show the trip brief structure, the few questions that genuinely
matter, and the rule modules you would load conditionally.
```

Correct behavior includes:

- no inherited budget, travelers, ability, or interests;
- no demand to complete every module;
- dates, destination scope, budget, hiking intent, ability, and bookings treated as per-trip data;
- no automatic full load of entry, lodging, or transport before a current question needs them; it should explain their future triggers and load hiking/track review only when hiking enters scope;
- `debug loading` may expose the three controls and files actually read during a routing test; normal trip answers should hide that internal process;
- no invented prices, visas, weather, or trail status.

## Update

For a Git clone with symbolic links:

```bash
git pull --ff-only
```

For uploaded packages or manual copies, download the new Release and read the changes before replacement. Back up personal rule edits first; do not overwrite uncommitted preferences.
