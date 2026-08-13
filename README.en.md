# AI Travel Planning Kit（AI 旅行规划工具包）

## Let AI research, compare, schedule, budget, and deliver a trip plan you can actually follow

[中文主页](README.md) · [Usage guide in Chinese](docs/usage-guide.md) · [Agent setup guide](docs/agent-platforms.md) · [Prompt library](examples/prompts.md)

**AI Travel Planning Kit** is an open-source set of instructions and templates for AI agents. Give the AI a destination, dates, travelers, budget, confirmed bookings, and your real priorities. The kit tells it how to research current facts, compare options, build a workable route, expose uncertainty, and produce a practical travel package.

It is not a booking app and it is not a fixed itinerary. It is a reusable planning tool that helps an AI do more complete travel work:

- screen classic and lesser-known places without treating popularity as value;
- choose accommodation areas and exact properties together with the route;
- place local food into each day instead of appending a viral restaurant list;
- verify transport, mobile payments, cash, exchange, connectivity, fees, tips, and scams;
- plan museums with actual exhibition value and Chinese-language access;
- add reproducible mobile-photography positions, light, composition, and reference images;
- review user-supplied hiking tracks and the surrounding permits, insurance, rescue, medical, lodging, food, equipment, and communication conditions;
- deliver a complete guide, a phone-friendly quick reference, images, and pre-departure updates.

All personal preferences are editable. Destination, dates, travelers, budget, and travel mode are collected again for each trip rather than hard-coded into a permanent profile.

## What it helps you do

| Capability | Practical result |
|---|---|
| Destination research | Find high-value candidates, challenge marketing noise, and explain what was excluded |
| Executable itinerary | Include door-to-door movement, queues, meals, rest, luggage, reservations, buffers, and safe return |
| Accommodation | Compare areas and exact properties by total price, transport, evening walkability, food, noise, and experiential value |
| Local dining | Research local everyday choices and place suitable restaurants, stalls, or markets into the route |
| Budget | Normalize currencies and price units, separate required and optional spending, and expose taxes, deposits, and hidden costs |
| Transport and payments | Verify the actual operator, fare medium, phone/card compatibility, cash, local wallets, SIM/eSIM, and fallbacks |
| Taxi and charter safety | Give route-specific price references, legitimate channels, written confirmation language, and scam warnings |
| International travel | Cover entry, official charges, service fees, tipping customs, local conditions, language labels, and a compact safety card |
| Museums | Assess what is actually worth seeing, current displays, Chinese interpretation, guide value, and a usable in-museum route |
| Photography | Recommend reproducible position, direction, composition, light, and sample images for phones and pocket cameras |
| Hiking | Review a supplied track plus permits, weather, insurance, medical access, communications, huts, water, exits, and rescue |
| Delivery | Derive Markdown, searchable PDF, a field quick-reference card, images, and an optional print fallback from one source |

## Install or import

The repository uses a standard `SKILL.md` layout and documents both native Agent Skill installation and file-upload fallbacks.

| Platform | Recommended method |
|---|---|
| OpenAI Codex | Link into `~/.codex/skills/plan-reliable-trips` and invoke `$plan-reliable-trips` |
| TRAE | Import in SOLO or copy into `.trae/skills/plan-reliable-trips` |
| WorkBuddy | Upload the skill ZIP from the latest GitHub Release |
| Claude Code | Put it in `~/.claude/skills/` or a project's `.claude/skills/` |
| Cursor | Use `.cursor/skills/`, `.agents/skills/`, or GitHub import |
| Windsurf | Use workspace `.windsurf/skills/` or the global skills directory |
| GitHub Copilot | Use repository `.github/skills/` / `.agents/skills/` or a personal skills directory |
| Gemini CLI | Link the bundled skill with `gemini skills link` |
| Other AI tools | Upload the core files and only the specialist modules needed for the trip |

See the [platform setup guide](docs/agent-platforms.md) for exact paths, UI steps, invocation examples, limitations, verification dates, and links to each product's official documentation.

Codex quick install:

```bash
git clone https://github.com/Lukala23/ai-travel-planning-kit.git
cd ai-travel-planning-kit
mkdir -p ~/.codex/skills
ln -s "$PWD/skill/plan-reliable-trips" ~/.codex/skills/plan-reliable-trips
```

## First request

You do not need to complete a long fixed questionnaire. Start with the information that can materially change the plan:

```text
Use the AI Travel Planning Kit for this trip.

Destination: ...
Dates: ...
Travelers: ...
Budget: ...
Confirmed bookings: ...
Main goals: ...
Other constraints: ...

Build a per-trip brief first. Ask only for missing information that materially
changes safety, feasibility, accommodation area, route structure, total budget,
or the main experience. Show candidate research and key trade-offs before
producing a full hour-by-hour itinerary.
```

After agreeing on the core places, accommodation area, transport structure, budget, and high-risk dependencies, ask the AI to generate the complete travel and execution plan.

## Why it is more than a prompt

- It is reusable and version-controlled.
- Modules load only when relevant; a city trip does not automatically receive hiking or road-trip chapters.
- Accommodation, food, transport, payments, route, and budget are planned together.
- Dynamic facts must be researched for the current trip.
- Source conflicts and uncertainty remain visible.
- The result is designed for use before and during the trip, not just for reading.
- Stable principles, soft preferences, and per-trip inputs stay separate, so users can safely customize them.

## Evidence rules

- Verify prices, opening, reservations, timetables, visas, weather, roads, trails, payment support, and inventory for the current trip.
- Use at least two independent sources for safety, law, and expensive non-refundable decisions; one should be the responsible authority or direct operator.
- Use official sources for rules and current operations, and recent visitor evidence for queues, wayfinding, and on-site problems.
- Treat social media as candidate discovery, not proof of value.
- Label claims as verified, recheck before departure, conditional, uncertain, or planning judgment.
- Preserve source conflicts and never invent fares, coordinates, schedules, tickets, track data, or official advice.

AI can make the planning more complete and easier to audit, but no model can guarantee that every dynamic fact is correct. Users must still confirm important bookings, high-risk activities, and last-minute conditions.

## Customize your preferences

Ask the AI to classify a proposed change before editing the files:

- safety or legal boundary;
- stable hard constraint;
- default preference that a specific trip may override;
- soft preference that should only improve ranking;
- per-trip input that must not carry into the next trip.

See [Review and edit rules with AI](docs/ai-review-guide.md). The detailed rationale behind the current Chinese-first defaults is recorded in [the constraint review](docs/constraint-review.md).

## Repository entry points

- [Skill entrypoint](skill/plan-reliable-trips/SKILL.md)
- [Trip brief template](skill/plan-reliable-trips/assets/trip-brief-template.md)
- [Planning principles](skill/plan-reliable-trips/references/planning-principles.md)
- [Source verification](skill/plan-reliable-trips/references/source-verification.md)
- [Delivery package](skill/plan-reliable-trips/references/deliverable-package.md)
- [Prompt library](examples/prompts.md)

## Responsible use

This project supports travel research and decision-making. It does not replace authorities, embassies, operators, medical professionals, insurers, licensed guides, or on-site rescue services. Dynamic facts change, and hiking track review is not a safety certification.

Do not publish passport numbers, identity documents, full payment data, verification codes, booking QR codes, private addresses, or unredacted personal itineraries.

## Contributing and license

Issues and pull requests are welcome, especially reproducible travel failures, regional verification methods, better source hierarchies, platform compatibility updates, and simplifications that improve real decisions. Read [CONTRIBUTING.md](CONTRIBUTING.md) first.

[MIT License](LICENSE)
