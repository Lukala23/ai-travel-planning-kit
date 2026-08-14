---
name: plan-reliable-trips-en
description: Research and create reliable, source-backed travel plans in English, including destination screening, accommodation, local dining, transit, taxis and charters, negotiated transport and scam prevention, payments, connectivity, road trips, borders and tipping, mobile-first photography with reference images, museum screening and language access, souvenirs, hiking-track review, overseas-trek logistics, insurance, medical access, lodging, food, equipment, and safety. Use when a user provides a destination or trip brief and asks to explore or compare places, choose lodging, food, or transport, design or revise an itinerary, plan around dates, weather, budget, mobility, payments, photography, bookings, driving, international travel, museums, souvenirs, or outdoor safety, or produce a practical Markdown guide, illustrated PDF handbook, quick-reference card, print fallback, or AI-queryable travel package.
---

# AI Travel Planning Kit

## Separate stable rules from per-trip data

Use only two data layers:

1. **Stable planning constraints**: research, verification, convenience, safety, decision, and delivery standards that do not change by destination. Read [references/planning-principles.md](references/planning-principles.md).
2. **Per-trip parameters**: destination, dates, travelers, budget, transport, ability, interests, travel modes, and confirmed commitments. Use [assets/trip-brief-template.md](assets/trip-brief-template.md) and collect them again for each trip.

Do not create an implicit permanent traveler profile. Never carry budget, companions, transport mode, or interests from a previous trip. Add a stable user rule only when the user explicitly says it should apply to future trips.

## Always read

- [references/planning-principles.md](references/planning-principles.md): stable research and decision standards;
- [references/source-verification.md](references/source-verification.md): dynamic facts, source quality, dates, and conflicts;
- [references/output-contract.md](references/output-contract.md): conditional deliverables and final QA;
- the current trip brief or per-trip data extracted from the user's current message.

If no form is supplied, build an internal trip brief from natural language. Review the core table first, then load only relevant optional modules. Keep blanks unknown; do not invent facts or force irrelevant fields.

## Conditional loading matrix

Trip modes are combinable tags, not a fixed sequence.

| Current task or mode | Also read |
|---|---|
| New destination, broad candidate set, destination exploration | [references/destination-research.md](references/destination-research.md) |
| Any overnight trip, accommodation area/property choice, or existing-booking review | [references/accommodation.md](references/accommodation.md) |
| Any day-by-day or timed itinerary | [references/route-core.md](references/route-core.md) |
| Route crosses a main meal, or user requests local food, restaurants, markets, or street shops | [references/dining.md](references/dining.md) |
| Bus, metro, rail, flight, ferry, shuttle, or intercity transfer | [references/public-transit.md](references/public-transit.md) |
| Taxi, ride-hail, airport transfer, charter, private driver, negotiated vehicle, carriage/riding, tuk-tuk, rickshaw, motorcycle hire, traditional boat, or unusual transport | [references/taxi-charter.md](references/taxi-charter.md) |
| Self-drive, car rental, or road trip | [references/self-drive.md](references/self-drive.md) |
| Any executable route with attractions, streets, museums, viewpoints, or hiking scenery; or explicit photography request | [references/photography.md](references/photography.md) |
| Museum, exhibition, memorial, or major venue is named; destination is a capital, major city, or historic/cultural city; or screening finds a high-value venue | [references/museum-visits.md](references/museum-visits.md) |
| Cultural venue, market, craft, souvenir, or local purchase | [references/souvenirs.md](references/souvenirs.md) |
| International, cross-border, foreign destination, or international transit | [references/international-travel.md](references/international-travel.md) |
| Hiking, mountaineering, trail, off-road, gorge, river crossing, snow/ice, or high altitude | [references/hiking-rules.md](references/hiking-rules.md) and the general route rules |
| Formal guide files, complete handbook, PDF, quick reference, print, image/screenshot directions, or an AI-queryable package | [references/deliverable-package.md](references/deliverable-package.md) |

When a user asks directly for an itinerary, perform enough candidate screening internally to support the choices; do not require a separate exhaustive candidate deliverable. Show a full candidate set only when requested.

## Workflow

### 1. Standardize the trip

Extract destination boundary, complete dates, usable time, start/end points, travelers, overnight/accommodation status, dietary needs, mode tags, core goals, hard constraints, budget, and confirmed bookings.

- Write `Unknown` instead of inheriting an earlier answer.
- Convert relative dates such as “next week” or “spring” into explicit dates or windows and show the interpretation.
- Ask at most three grouped questions, only for gaps that materially change safety, feasibility, cost, accommodation area, or route structure.
- Use explicit replaceable assumptions for non-critical gaps.

### 2. Set research depth

Tasks may combine:

- `Explore`: build a broad destination candidate set;
- `Route`: create or revise an executable itinerary;
- `Compare`: compare routes, accommodation areas, transport, or activities;
- `Outdoor`: design or review hiking or mountaineering plans;
- `Update`: recheck dynamic facts in an existing guide.

Do not force every request through exploration → route → booking.

### 3. Search and evaluate candidates

Confirm destination boundary and transport structure, then find relevant candidates. For overnight trips, actively build accommodation-area and property candidates. For routes crossing meals, build representative food and venue candidates. Evaluate value and real friction together: access, operating window, booking, queues, ability, cost, luggage, parking, and safe return. Do not use popularity as fit or straight-line map distance as convenience.

### 4. Verify dynamic facts

Research every fact that determines whether the user can go, when, at what cost, or safely. If a fact cannot be verified, deliver only a status-labelled draft. Never fabricate sources, schedules, fares, coordinates, or tracks.

### 5. Build the plan

Use the current trip brief, not past parameters. For overnight trips, optimize route structure, exact accommodation, nearby walking, and food together; control budget with the total stay price and induced transport. Put important local food into each day using current opening, queue, and detour. Explain key trade-offs and the condition that activates each alternative.

### 6. Deliver conditionally

Output only what the task needs. Every overnight route must use an accommodation base and reach an accommodation conclusion; if already booked, assess its route effect without producing an unsolicited replacement ranking. Every route crossing a main meal must include an executable dining area or screened venue, but need not fix every meal to one restaurant. Do not add unrelated driving, hiking, or photography chapters for template completeness.

After the route is confirmed and formal files are requested, derive the complete digital handbook, quick reference, and necessary print fallback from one source of truth. Never maintain contradictory itinerary copies.

## Priority order

Resolve conflicts in this order:

`Safety and law > current official status > current hard constraints > confirmed bookings > current preferences > convenience and experience optimization > content volume`

No per-trip preference may override safety, law, or verification requirements.
