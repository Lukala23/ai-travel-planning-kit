# TravelSpec AI

## Turn travel inspiration into a verified, executable, and updateable travel system

[中文主页](README.md) · [Usage guide](docs/usage-guide.md) · [Prompt library](examples/prompts.md)

TravelSpec AI is not another destination-to-itinerary demo. It is an open-source constraint layer, research standard, decision workflow, and delivery protocol for AI-assisted travel planning.

It tells an AI:

- what must be researched;
- how to separate popularity from actual travel value;
- which facts must be verified live;
- how to expose uncertainty and source conflicts;
- how to combine accommodation, food, transport, payments, language, photography, museums, and safety;
- how to deliver a guide that remains usable on the road.

The project is Chinese-first. Its defaults currently suit a Chinese-speaking traveler with limited English, mobile-first photography, and a preference for practical, locally grounded experiences. Fork it and change the preferences without weakening its evidence and safety rules.

## Why

Many AI travel plans look complete but fail in practice:

- opening hours, ticket rules, visas, transport, and trail status are stale;
- social popularity is mistaken for value;
- accommodation and meals are detached from the route;
- public-transport payment and local-wallet requirements are ignored;
- taxi and charter prices have no route-specific reference or scam prevention;
- museums lack current exhibition value, language support, and an actual visit path;
- photo advice has no reproducible position, light, or reference image;
- hiking plans omit track integrity, permits, exit points, rescue, insurance, and communications;
- the final guide is too long to use quickly during the trip.

TravelSpec AI addresses those failures with modular constraints and explicit verification.

## Core design

The system separates:

1. **Stable planning constraints** — evidence standards, safety boundaries, convenience checks, decision rules, and delivery quality.
2. **Per-trip parameters** — destination, dates, travelers, budget, confirmed bookings, travel modes, abilities, and trip-specific goals.

Domestic, international, city, road-trip, museum, photography, and hiking modules can be combined without forcing every trip through one fixed sequence.

## Major capabilities

| Area | What the skill requires |
|---|---|
| Destination screening | Search broadly, remove marketing noise, and rank by real value and trip fit |
| Accommodation | Optimize area, exact property, route, local food, total cost, and experiential stays together |
| Dining | Research local everyday food and place it into the route instead of appending a viral list |
| Transit and payments | Verify the exact operator, fare medium, device/card compatibility, and fallback |
| Taxi and charter | Provide route-specific price references, written total-price confirmation, scam warnings, and help channels |
| International travel | Separate official fees, taxes, service charges, tips, deposits, and reported unofficial solicitation |
| Museums | Verify what is actually on display, Chinese-language access, guide value, price, and in-museum routing |
| Photography | Provide reproducible sample images, position, direction, light, mobile composition, and limitations |
| Hiking | Review a user-provided track for version, gaps, jumps, wrong branches, restrictions, key points, and support conditions |
| Delivery | Derive Markdown, searchable PDF, a field quick-reference card, images, and an optional print fallback from one source |

## Install as a Codex skill

OpenAI's [Save workflows as skills](https://learn.chatgpt.com/codex/use-cases/reusable-codex-skills) explains that skills in `~/.codex/skills` are available across repositories.

```bash
git clone https://github.com/Lukala23/travelspec-ai.git
cd travelspec-ai
mkdir -p ~/.codex/skills
ln -s "$PWD/skill/plan-reliable-trips" ~/.codex/skills/plan-reliable-trips
```

Do not overwrite an existing skill with the same name without comparing or backing it up.

Invoke it in a new Codex task:

```text
Use $plan-reliable-trips.

Turn my natural-language trip request into a per-trip brief first.
Ask only for missing information that materially changes safety, feasibility,
the route structure, accommodation area, or total budget.

Destination: ...
Dates: ...
Travelers: ...
Budget: ...
Confirmed bookings: ...
Main goals: ...
```

## Use with other AI systems

Provide `SKILL.md`, the core planning, source-verification, and output rules, the trip brief, and only the relevant specialist modules. Results depend on the platform's file, browsing, image, PDF, and tool capabilities.

## Evidence discipline

- Verify prices, opening, reservations, timetables, visas, weather, roads, trails, payments, and inventory for the current task.
- Use two independent sources for safety, law, and expensive non-refundable decisions; at least one should be the competent authority or direct operator.
- Use official sources for rules and operational state; use recent visitor reports for experience and problem discovery.
- Treat social media as candidate discovery, not proof of value.
- Label information as verified, recheck before departure, conditional, uncertain, or planning judgment.
- Preserve source conflicts instead of hiding them behind fluent prose.
- Never fabricate fares, coordinates, tickets, schedules, track data, or official advice.

## Responsible use

This project supports travel research and decision-making. It does not replace authorities, embassies, operators, medical professionals, insurers, licensed guides, or on-site rescue services. Dynamic facts change, and track review is not a safety certification.

Do not publish passport numbers, identity documents, full payment data, verification codes, booking QR codes, private addresses, or unredacted personal itineraries.

## Repository

- [Skill entrypoint](skill/plan-reliable-trips/SKILL.md)
- [Trip brief template](skill/plan-reliable-trips/assets/trip-brief-template.md)
- [Planning principles](skill/plan-reliable-trips/references/planning-principles.md)
- [Source verification](skill/plan-reliable-trips/references/source-verification.md)
- [Delivery package](skill/plan-reliable-trips/references/deliverable-package.md)
- [Full design review](docs/constraint-review.md)

## Contributing

Issues and pull requests are welcome, especially reproducible travel failures, regional verification methods, better source hierarchies, and simplifications that improve actual decisions. Read [CONTRIBUTING.md](CONTRIBUTING.md) first.

## License

[MIT](LICENSE)
