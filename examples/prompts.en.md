# AI Travel Planning Kit: copyable prompts

[中文版](prompts.md)

Replace bracketed text with your own details. You do not need to use every prompt.

Use `$plan-reliable-trips-en` in Codex. In TRAE, WorkBuddy, Claude Code, Cursor, Windsurf, GitHub Copilot, Gemini CLI, or file-upload mode, use the invocation shown in the [English platform guide](../docs/agent-platforms.en.md), or simply say “Use AI Travel Planning Kit.”

## 1. Build a trip brief from natural language

```text
Use $plan-reliable-trips-en.

I am going to [destination] on [full dates] with [number and travelers].
Already fixed: [flights / accommodation / performance / other commitments].
Budget: [amount or cost sensitivity].
The most important result for this trip is [core goal].

Do not schedule the route yet. Build a per-trip brief and separate known facts,
hard constraints, soft preferences, unknowns, and temporary assumptions.
Ask only about missing information that changes safety, feasibility,
accommodation area, transport structure, or total budget.
```

## 2. Research a destination before scheduling

```text
Research and screen the full candidate set for [destination].

Search classic places, high-value lesser-known places, seasonal experiences,
museums, and bookable activities. Do not treat platform ranking, likes, or viral
status as value. Return A/B/C candidates plus a small D list for famous places
I may wonder about. Also explain accommodation areas, transport structure, and
which decisions must be confirmed first.
```

## 3. Build an executable route draft

```text
Create a route draft from the confirmed candidates and accommodation area.

Include door-to-door travel, queues, normal meals, rest, luggage, reservation
buffers, and safe return. Use a normal balanced sightseeing pace by default,
but express intensity through daily start/end time, walking/standing load,
fixed bookings, and the first items to cut. Add fallbacks only for real risks;
state each trigger and which later nodes it changes.
```

## 4. Accommodation research

```text
Re-evaluate [destination] with accommodation as part of the route.

Compare areas before exact properties. Normalize dates, travelers, room type,
bed type, breakfast, cancellation, taxes, and currency, and show the true total
stay price. Evaluate daily sightseeing travel, airport/station access, evening
walkability, local food, late return, noise, and the stay's own experiential
value. Do not recommend from one platform score alone.
```

## 5. International payments, connectivity, and transport scams

```text
This is an international trip to [country/city]. Verify:
1. whether public transport actually accepts my phone, bank cards, and
   international wallets;
2. cash needs, exchange/ATM costs, and payment for the first trip after arrival;
3. roaming, travel eSIM, and local SIM compatibility plus primary/fallback plans;
4. normal prices, units, and legitimate channels for airport transfer, key
   charters, and unusual transport;
5. local-language wording that confirms the total price in writing;
6. common overcharging, currency switching, off-platform payment, or luggage-
   retention risks, and how to seek help.
```

## 6. Museums and language access

```text
Research the museums, galleries, memorials, and small specialist museums that
are genuinely worth including in [destination].

Do not rely on fame or total collection size. Verify what is actually on view,
core-gallery closures, uniqueness, overlap with other museums, and realistic
visit time. Check official [preferred language] labels, audio, apps, tours, and
private guides. Say whether a guide is worth the price, what the current price
includes, and provide an executable route through each priority museum.
```

## 7. Photography and reference images

```text
Scan the whole route for photographic opportunities.

I mainly use a phone and, at most, a pocket stabilised camera. Prioritise
composition, position, direction, light, people placement, and clean framing;
do not assume professional gear. Provide sourced real reference images for
priority shots and ordinary sights whose composition is hard to explain in
words. State what to learn, whether a normal visitor can reproduce it, and
whether it depends on a drone, long-lens compression, heavy editing, or a rare
season. Treat long waits, major detours, or sacrificed core experiences as an
optional photography upgrade.
```

## 8. Review a downloaded hiking track

```text
Use $plan-reliable-trips-en to review the hiking file, link, or screenshots I provide.

Check source, name, version, date, direction, distance, ascent, endpoints,
track breaks, jumps, wrong branches, closed/private/restricted sections, huts,
water, checkpoints, hazards, exits, and transfers. Combine the track with
permits, weather, season, daylight, ability, insurance, rescue, and
communications. Return Usable / Conditionally usable / Do not use, list every
required correction, and state clearly that this is not a safety certification.
```

## 9. Review one long-term rule

```text
Review only the rules about [topic]. Do not edit yet.

Explain:
1. what the current rule makes the model do;
2. whether my comment is a safety boundary, stable hard constraint, default,
   soft preference, or per-trip parameter;
3. whether a casual preference has become a rigid rule;
4. which file should change and which outputs it affects.

Then propose simplified wording and wait for confirmation.
```

## 10. Generate the formal travel package

```text
The route and key choices are confirmed. Generate:

- 00_START_HERE.md
- 01_TRIP_QUICK_CARD.pdf
- 02_COMPLETE_TRAVEL_HANDBOOK.md
- 02_COMPLETE_TRAVEL_HANDBOOK.pdf
- media/
- 03_PRINT_EMERGENCY.pdf when this trip needs it

Derive every version from one Markdown source of truth. Include trip dates,
version, generation date, latest verification date, and recheck points. PDFs
must have a text layer, bookmarks, internal links, and image descriptions; do
not create scanned-only PDFs.
```

## 11. T-7 day update

```text
Update this package at T-7 days.

Recheck local weather, temporary closures, construction, gallery/trail status,
restaurants, main services, and important reservations. List changes and
affected route nodes first. Edit only affected sections, then rebuild the
Markdown, PDF, and quick card together.
```

## 12. T-48 hour review

```text
Perform the T-48 hour review.

Focus on warnings, flights/trains/ferries, trail or road status, important
bookings, meeting points, entrances, payments, and connectivity fallbacks.
Classify each item as No change / Must adjust / Human confirmation still needed,
and explain how every change affects later transport, meals, bookings, and return.
```

## 13. Give the handbook to an AI during the trip

```text
This handbook was verified on [date].

Cite the section used in every answer. Recheck today's prices, opening,
schedules, weather, visas, roads, and trails online. Separate:
1. facts already in the handbook;
2. current online updates;
3. your new planning judgment based on both.
```

## 14. Replan a rainy day without rewriting the trip

```text
Weather changed on [date]. Replan only today and later nodes that are genuinely affected.

Protect non-refundable bookings, important transport, and safe return. Explain
what was removed, moved, or replaced; reconnect transport and meals; and move
photography, outdoor, or evening activities to a better day. Do not regenerate
the entire trip without cause.
```
