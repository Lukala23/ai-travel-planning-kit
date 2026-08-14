# Stable travel-planning constraints

Keep only planning methods that do not vary by destination, date, or mode. Destination, budget, travelers, transport, interests, and ability come from the current trip brief.

## 1. Isolate every trip

- Read a new trip brief for each trip.
- Do not turn old trip parameters into long-term preferences.
- A blank means unknown, not consent to a default.
- When the brief changes, recompute the whole plan instead of patching old assumptions.
- Add a permanent rule only after the user explicitly confirms future scope.

## 2. Search attractions and experiences

- Define administrative, normal travel, and acceptable day-trip boundaries.
- Search representative, lesser-known, seasonal, reservation-only, and high-fit candidates together; viral lists are not the candidate universe.
- Lightly scan museums, galleries, memorials, site museums, and specialist venues for every destination. Search more deeply in capitals, major cities, and historic/cultural cities; include high-value small venues.
- For non-English destinations, also use map-searchable local names, official English names, and necessary local-language terms.
- Deduplicate aliases, sub-attractions, and repackaged duplicate experiences.
- Search widely enough to support the current choice; show an exhaustive set only on request.
- Fame does not guarantee inclusion; obscurity does not guarantee recommendation.
- Screen and grade internal candidates before presenting them.

### Marketing and manipulable signals

Use social media, lists, ratings, and likes for discovery, not independent value evidence. For high-visibility places, check:

- repeated copy, position, filter, or campaign language;
- disclosed or hidden sponsorship, gifts, group deals, rebates, agency, or commercial relationships;
- sudden score concentration versus recent ordinary text, original photos, and negative reports;
- dependence on drone, long-lens compression, heavy editing, restricted areas, paid sets, or a tiny seasonal window;
- whether actual content, scale, and reasonable dwell time justify queue, ticket, detour, and extra spend;
- whether cross-platform sources are independent rather than copies of one campaign.

Use `High marketing risk` with observable reasons; never accuse rating manipulation or fraud without evidence. Put a high-marketing, low-irreplaceability place in grade D.

## 3. Evaluate every candidate

| Dimension | Question |
|---|---|
| Travel value | What is irreplaceable, or can a similar option substitute? |
| Fit for this trip | How does it match current goals, days, travelers, budget, pace, transport, or hard constraints? Use `Cannot yet assess` when needed. |
| Access | What is the real door-to-door path and cost from current nodes? |
| Time compatibility | Can opening, last admission, light, season, and services fit? |
| Booking friction | Required, strongly advised, or walk-up? What is sell-out cost? |
| Physical friction | Are walking, steps, ascent, queue, and luggage reasonable? |
| Cost friction | Do ticket, transport, parking, and extras fit this budget? |
| Risk and exit | What happens with weather, closure, delay, or low energy? |
| Information status | What is verified, due for recheck, or uncertain? This does not change value grade. |
| Photo/social opportunity when relevant | Is light, angle, or an en-route shot worth using? Judge place identity, narrative, and reproducibility—not popularity. |

## 4. Break down “convenient”

Never write only “convenient” or “inconvenient.” Check:

- door-to-door time to the actual entrance;
- transfers, frequency, first/last service, and missed-service cost;
- entrance orientation, storage, luggage, accessibility, parking, and walking links;
- whether surrounding nodes are genuinely on the way;
- whether the user can return safely and reliably to accommodation or the next hub.

Use:

- `Low friction`: easy to integrate with stable timing and exit;
- `Medium friction`: needs a service, booking, detour, or buffer;
- `High friction`: large transfer cost, high failure cost, or difficult exit.

High friction does not mean low value; state whether the trip should pay the cost.

## 5. Design executable routes

- Explain route logic and trade-offs before an hourly table.
- Default an ordinary sightseeing trip to balanced sightseeing: cover genuinely high-value content within reasonable time, cost, and ability while preserving meals, rest, full experience, and safe return. Switch to holiday or high coverage only from current intent.
- Confirm intensity through daily start/end, core blocks, walking/standing, fixed bookings, and consecutive hard days—not only relaxed/balanced/intense labels.
- Do not apply a fixed buffer percentage. Protect expensive performances, timed guides, non-refundable bookings, last transport, flights/intercity services, and return day according to consequence and uncertainty.
- Build the skeleton from season, daylight, and typical weather risk; update with local forecasts/warnings inside a useful window and state retime, swap, cancel, and fallback conditions.
- For overnight trips, actively research areas and properties and optimise them with route, local walking, and food. Count total stay cost, induced transport, and luggage moves.
- For routes crossing a main meal, research representative local food and credible local-clientele venues; social visibility is only discovery.
- Optimise complete experience and executability, not attraction count.
- Count transport, transfers, queues, security, storage, meals, rest, wayfinding, and buffers.
- Give every day a start, endpoint, and return.
- Separate hard anchors, core experiences, movable nodes, and spare-capacity additions. Cut low-priority nodes before meals, rest, movement, or safe return.
- Raise priority when photographic and social-sharing value are both independently high and extra cost is manageable; otherwise compare normal and photography-upgrade options.
- Explain important omissions.
- Never present map or model estimates as guarantees.

## 6. Keep information and decisions transparent

- Separate fact, estimate, inference, and recommendation.
- Follow `source-verification.md` and place direct sources beside dynamic conclusions.
- Preserve source conflicts instead of hiding them behind false precision.
- At the beginning, state current parameters, unknowns, and temporary assumptions.
- At the end, show only the few decisions and pre-departure rechecks that still matter.

## 7. Confirmed default rules

These defaults may be edited by a user, but remain distinct from per-trip data:

1. Prefer verified existing cross-border mobile/open-loop contactless payment. Recommend a local wallet only when local benefit outweighs registration, top-up, and balance-exit cost; always provide an independent fallback.
2. Physical cards and cash are acceptable for international travel. Estimate real cash scenarios before comparing home exchange, legal local exchange, ATM spreads, fixed/withdrawal fees, DCC, limits, and leftover loss.
3. Treat international connectivity as infrastructure. Compare carrier roaming, manufacturer travel data/virtual SIM, travel eSIM, and local SIM for the exact phone; use a local card when required or materially better, and save essential information offline.
4. Default photography equipment to a phone and at most a pocket device. Prioritise composition, position, light, people, and aesthetics. Scan ordinary sights as well as photography locations, attach sourced references where useful, accept a worthwhile early start, and keep long waits/detours/sacrificed core experiences as an optional upgrade.
5. Default ordinary sightseeing to balanced coverage; switch to holiday or high coverage only from current intent. Confirm concrete daily intensity.
6. Use consequence-based buffer, season/daylight, and near-term local weather. Do not generate a late-start version by default.
7. Scan museums everywhere and more deeply in capitals and cultural cities. Assess actual display, uniqueness, curation, duplication, time, and the traveler's preferred interpretation language. For a Chinese-speaking traveler with limited English, explicitly evaluate Chinese support and guide value.
8. Keep souvenirs lightweight: locally distinctive, interesting, portable, and reasonably priced for self or friends. Handmade/rare is a bonus, not a gate; do not default to valuable collectibles.
9. Treat accommodation as a core overnight research task using official and relevant booking channels with normalized comparison, route, walking, food, true total, conditions, and experiential value. Avoid no-value moves but permit worthwhile experiential stays.
10. Treat food as part of the route. Research everyday local food and venues with strong local-clientele evidence; cross-check social/map leads and put important meals into the day with fallbacks.
11. For taxis, charters, and negotiated/unusual transport, give route/time-specific price reference, useful currency conversion, unit, basis, inclusions, legitimate channel, written local-language confirmation, scam prevention, help path, and any safety or animal-welfare check.
12. Research normal border preparation by default; fast-track/concierge only when relevant. Warn about repeatedly reported unofficial checkpoint demands from credible evidence, distinguish official charges, and never advise paying public officials.
13. Separate statutory tax, mandatory service and other surcharges, card fee, voluntary tip, and deposit/pre-authorisation; give an itemised-dispute process for unexplained charges.
14. Give every international trip one compact operating and safety card.
15. Let users manage hiking tracks in their software. Reliable route and key-point data are a safety gate; review supplied tracks without creating a safety guarantee. For overseas treks, prioritise access, safety, insurance/rescue, medical/altitude, lodging, food/water, communication/power, cash, equipment, and weather contingency. Guides/porters depend on law and current conditions.
