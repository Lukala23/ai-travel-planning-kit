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

## 9. Review one module rule or preference

```text
Review only the rules about [topic]. Do not edit yet.

Explain:
1. what the current rule makes the model do;
2. whether my comment is a safety boundary, current hard constraint, overridable default,
   soft preference, or per-trip parameter;
3. whether a casual preference has become a rigid rule;
4. which file should change and which outputs it affects.

Do not create a long-term preference index. Then propose simplified wording and wait for confirmation.
```

## 10. Generate the formal travel package

```text
The route and key choices are confirmed. Generate:

- 00_START-HERE.md
- 01_OFFLINE_MOBILE.html
- 02_COMPLETE-TRAVEL-HANDBOOK.md
- 02_COMPLETE-TRAVEL-HANDBOOK.pdf
- media/
- 01_TRIP-QUICK-REFERENCE.pdf as the print counterpart of the offline page when a paper backup is needed
- 03_PRINT-EMERGENCY.pdf when this trip needs it

Derive every version from one Markdown source of truth. Include trip dates,
version, generation date, latest verification date, and recheck points. PDFs
must have a text layer, bookmarks, internal links, and image descriptions; do
not create scanned-only PDFs. Build the offline mobile page from the template
as one self-contained file and accept it in a real phone browser.
```

## 11. T-7 day update

```text
Update this package at T-7 days.

Recheck local weather, temporary closures, construction, gallery/trail status,
restaurants, main services, and important reservations. List changes and
affected route nodes first. Edit only affected sections, then rebuild the
Markdown, offline mobile page, PDF, and quick card together.
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

## 15. Check minimum trip conditions first

```text
Use $plan-reliable-trips-en and do not research a complete attraction list yet.
For [destination / dates / days / travellers / budget / actual origin and return endpoint],
state the minimum trip conditions: entry/permit for the travel document, round-trip
long-distance access, major unavoidable costs, and my execution assumptions. Mark each
Met / To confirm / Not met, then return Feasible / Conditionally feasible / Material
mismatch / Cannot yet assess. Even with no obvious blocker, retain conditions still to
arrange, satisfy, or recheck. For a clear blocker, give two or three smallest adjustments.
```

## 16. Non-hiking altitude, medicine, and care readiness

```text
Use $plan-reliable-trips-en for an ordinary sightseeing trip in [high-altitude city]; no hiking.
Expected sleeping altitude is [value]. I have [only relevant condition category] and carry
[medicine generic name/device]. Load the health module; separate entry mandates from advice,
and verify medicine import, acclimatisation, food/vector exposure, suitable care, payment,
and evacuation. Label clinician decisions Professional assessment required; do not diagnose or dose.
```

## 17. Rental vehicle and essential insurance reminders

```text
Use $plan-reliable-trips-en to compare rental options for [destination / dates / route].
Cover rental terms, CDW/LDW, liability, excess, fuel/charging, toll tag, winter equipment,
border use, assistance, and penalties. I will arrange whole-trip insurance independently;
flag only mandatory evidence, special-activity, remote-evacuation, or planned card-benefit
conditions that are easy to miss. Do not rank insurance products or compare a full policy.
```

## 18. Search from the actual origin and decide when to book

```text
Use $plan-reliable-trips-en to search flights for [travelers] on [full dates/flexibility]
from [actual origin] to [first trip node] and from [last trip node] to [return point]. Cabin [ ],
baggage [ ], connection/red-eye/self-transfer tolerance [ ], and fare budget/refund priority [ ].

Compare nonstop, protected connections, and useful open-jaw structures from the actual origin.
Add another gateway only when complete cost and risk genuinely improve. Use direct airlines plus
reputable channels in my sales market that I can actually buy from. Include positioning, airport
change, hotel, baggage recheck, and missed-connection risk rather than comparing sticker fare alone.

Return at most genuinely distinct Balanced recommendation / Lowest complete cost / More comfortable
or lower risk finalists, then conclude Buy now / Set alerts and observe / Wait for trip conditions /
Cannot yet assess. If observing, state the current complete fare, target or buy trigger, platforms,
and latest decision date. If the host has no real scheduler, label this a manual protocol instead of
promising background monitoring. Do not apply a universal advance-purchase rule or treat an alert as inventory.
```
