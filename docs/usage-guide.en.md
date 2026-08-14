# AI Travel Planning Kit: complete usage guide

[中文版](usage-guide.md)

This guide explains how to use **AI Travel Planning Kit** for a real trip—from the first destination request through accommodation and route decisions, package generation, pre-departure updates, and questions on the road.

For installation only, see [Setup and use in different AI agents](agent-platforms.en.md).

## 1. Choose a mode

### Native Agent Skill

Codex, TRAE, WorkBuddy, Claude Code, Cursor, Windsurf, GitHub Copilot, and Gemini CLI use different Skill directories and import flows. Follow the [platform guide](agent-platforms.en.md) instead of applying the Codex path to every product.

Codex example for the English Skill:

```bash
git clone https://github.com/Lukala23/ai-travel-planning-kit.git
cd ai-travel-planning-kit
mkdir -p ~/.codex/skills
ln -s "$PWD/skill/plan-reliable-trips-en" ~/.codex/skills/plan-reliable-trips-en
```

Do not overwrite an existing destination without comparing or backing it up.

```text
Use $plan-reliable-trips-en for the trip below.
Build a per-trip brief first, then tell me which missing facts would change the
route or safety.
```

### File-upload mode

An AI that supports files or workspace context can use the same rules without native Skills. Provide:

1. `SKILL.md`;
2. `planning-principles.md`;
3. `source-verification.md`;
4. `output-contract.md`;
5. the current trip brief;
6. only the specialist rules relevant to this trip.

| Trip need | Load |
|---|---|
| Overnight trip / hotel choice | `accommodation.md` |
| Route crosses a main meal | `dining.md` |
| Bus, metro, rail, or ferry | `public-transit.md` |
| Taxi, transfer, charter, carriage, or negotiated transport | `taxi-charter.md` |
| Self-drive | `self-drive.md` |
| International / cross-border | `international-travel.md` |
| Hiking / mountaineering | `hiking-rules.md` |
| Museum / gallery | `museum-visits.md` |
| Photography | `photography.md` |
| Formal PDF / quick card | `deliverable-package.md` |

## 2. Prepare one trip's information

Do not place a lifetime of preferences into every request, and do not guess answers just to complete a form.

### Usually necessary

- destination and trip boundary;
- start and end dates and usable time;
- start and end points;
- travelers and important limitations;
- bookings or commitments that cannot change;
- approximate budget or cost sensitivity;
- travel mode and the most important goal for this trip.

### Only when relevant

- driving documents, vehicle, and parking requirements;
- hiking ability, altitude experience, and track source;
- interpretation or guide budget;
- willingness to invest extra time in photography;
- gift recipients and souvenir budget;
- accessibility, children, diet, medical needs, or special activities.

Write `Unknown` when something is not decided. See the [English trip brief](../skill/plan-reliable-trips-en/assets/trip-brief-template.md).

## 3. Use the right planning sequence

### Stage A: trip brief

```text
Do not schedule the route yet. Turn my information into a per-trip brief with:
known facts, hard constraints, soft preferences, unknowns, and temporary assumptions.
Ask only about gaps that change safety, feasibility, accommodation area,
transport structure, or total budget.
```

Check that the AI has not inherited travelers, budget, dates, equipment, or interests from another trip.

### Stage B: candidates and structure

Ask the AI to establish:

- the destination's genuinely core experiences;
- which famous places have value and which mainly have marketing reach;
- how accommodation areas affect daily transport, evening walking, and food;
- structural constraints from transport, payment, booking, visas, season, and weather;
- expensive or risky decisions that require confirmation first.

The goal is to choose, not to force every candidate into the itinerary.

### Stage C: route draft

A route should include:

- each day's start and finish;
- door-to-door movement, queues, and buffers;
- normal meals and rest;
- latest safe arrival for important bookings;
- return to accommodation or the next transport node;
- executable cuts or swaps for weather, closure, or delay;
- clear units and required versus optional costs.

### Stage D: specialist verification

Check only what this trip needs:

- accommodation total price, taxes, cancellation, and exact room type;
- whether public transport really accepts the user's existing phone, wallet, or cards;
- normal taxi, charter, and unusual-transport prices plus written confirmation language;
- local SIM/eSIM, roaming, and offline fallback;
- statutory tax, service charge, tip, deposit, and reported unofficial demands;
- what is actually on display in museums, language access, and guide value;
- reference photographs, shooting position, and reproducibility;
- hiking track integrity, permits, exits, rescue, insurance, and medical access.

### Stage E: formal delivery

After the route and key choices are confirmed:

```text
The route is confirmed. Generate the formal travel package.
Use one Markdown source of truth for the complete PDF, quick card, and required images.
Put the version, generation date, latest verification date, and recheck points in every file.
```

## 4. Judge source reliability

| Source | Good for | Cannot prove alone |
|---|---|---|
| Government / competent authority | Law, visa, permit, safety, official fee | Subjective experience |
| Attraction / operator | Opening, tickets, services, entrance, policy | “Most worthwhile” |
| Booking platform | Current inventory, channel total, cancellation | Long-term stable quality |
| Professional / research source | Collections, history, culture, expert context | Current opening |
| Maps and recent visitors | Wayfinding, queues, construction, field conditions | Law, safety, official rules |
| Social media | Discovering candidates, seeing ordinary photos | Real value or current legality |

Use five explicit states:

- `Verified`: a current direct source supports it;
- `Recheck before departure`: usable now but likely to change;
- `Conditional`: depends on weather, permit, transport, or a user decision;
- `Uncertain`: sources conflict, are stale, or cannot be accessed;
- `Planning judgment`: a recommendation inferred from facts, not a source quotation.

Place citations beside conclusions and include the verification date. Safety, law, and expensive non-refundable decisions require at least two independent sources, including the responsible authority or direct operator.

## 5. Photography and wayfinding images

A photography reference should answer “what can I reproduce?”:

- where to stand and which way to face;
- useful time and light;
- where to place people;
- whether phone wide or standard view works better;
- whether the image depends on a drone, long-lens compression, heavy editing, or a rare season.

An entrance or transfer image should answer “how will I recognise it?”:

- correct door, gate, exit, platform, or meeting point;
- circles and arrows on the image;
- entrance name in local script;
- copyable map name or address;
- nearby landmark and verification date.

Every critical instruction also needs a text version; never leave it only in an image.

## 6. Hiking track review

First obtain a credible route in your own hiking software, then provide:

- route link or identifier;
- GPX, KML, FIT, or another track file;
- app screenshots;
- a list of key waypoints.

The AI should review source and version, endpoints, distance and ascent, breaks and jumps, wrong branches, closed or restricted sections, huts, water, checkpoints, hazards, exits, and transfers. The conclusion must be:

- `Usable`;
- `Conditionally usable`;
- `Do not use`.

Track review is not a safety certification. Weather, permits, ability, equipment, and rescue conditions can still make the route unusable.

## 7. Update before departure

### Around T-30 days

- visas, permits, insurance;
- popular reservations, performances, and intercity transport;
- accommodation cancellation deadlines;
- guides and special activities that require lead time.

### Around T-7 days

- local weather after entering a useful forecast window;
- closures, works, gallery and trail status;
- restaurants, services, and the main route;
- clothing, luggage, and equipment changes.

### Around T-48 hours

- weather warnings and mountain or coastal local conditions;
- flights, trains, ferries, and transfers;
- important bookings, entrances, and meeting points;
- payment, connectivity, and offline fallback.

## 8. Use the package during the trip

- Start with the quick card for immediate action.
- Search the complete PDF by local name or tags such as `[Entrance]`, `[Payment]`, `[Risk]`, and `[Photo]`.
- When giving the PDF to an AI, require the section and document verification date used.
- For live changes, require current online verification rather than relying only on the old PDF.
- After a change, check downstream bookings, transport, meals, return, and accommodation.

```text
This handbook was verified on [date]. Tell me that date first.
Cite the section used. Recheck today's weather, opening, fares, services, and roads online.
Separate handbook content, current updates, and your new planning judgment.
```

## 9. Privacy and safety

The trip brief should not contain:

- passport or identity numbers;
- full card data, payment passwords, or verification codes;
- unnecessary phone numbers or account credentials;
- a private home address;
- unredacted booking QR codes or identity images.

Before a public issue or prompt, also inspect travel dates, accommodation orders, contacts, and location information for necessary redaction.

## 10. When a rule does not fit

Do not silently override a long-term rule inside one trip. Use the [AI review guide](ai-review-guide.en.md) to classify it as a safety boundary, stable hard constraint, default preference, soft preference, or per-trip parameter. Change only the authoritative file that truly needs to change and record the impact.
