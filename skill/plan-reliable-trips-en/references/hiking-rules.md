# Hiking, Mountaineering, and Outdoor Route Rules

For safety matters, this module overrides the general route rules. The goal is to decide whether a route fits, what preparation and access it needs, how to exit, and when to turn back. It does not replace the user's hiking app with printed maps, a new track, or turn-by-turn navigation.

## 1. Safety gate

Before recommending execution, verify:

- official open/closed status, permits, quotas, construction, fire restrictions, hunting season, and protected-area rules;
- mountain/local weather for the route date: thunderstorm, wind, snow/ice, visibility, temperature range, and recent conditions;
- route-specific flood, tide, canyon rain, river crossing, avalanche, rockfall, glacier, heat, wildlife, or terrain risk;
- daylight, latest sensible start, personal turnaround time, exits, and safe-return plan;
- trailhead transport, parking, final shuttle, luggage, and what happens if the service fails;
- the least-experienced traveler's distance, ascent, technical terrain, exposure, altitude experience, and equipment;
- abroad: guide/agency mandates, restricted areas, insurance/rescue eligibility, lodging/camping, food/water, communication, and local payment ability.

Do not give an unconditional “go as normal” recommendation when the route is officially closed, a required permit is unavailable, a serious warning applies, critical status cannot be verified, difficulty clearly exceeds ability, required equipment is missing, or safe return is not credible. Offer a safer route, qualified-guide condition, or postponement trigger.

## 2. Reliable track data is a gate

- Distance, cumulative ascent, high point, estimated time, coordinates, and track geometry must come from a reliable route source or verifiable map calculation.
- Distinguish one-way, out-and-back, loop, traverse, and transfer-inclusive distance. Elevation and cumulative ascent are different.
- When sources disagree, give a range and likely reason such as version, trailhead, side trip, direction, or sampling.
- Never infer a route from an attraction name, prose blog, or a few screenshots.
- Before departure, confirm the user can obtain the correct route/track in their own hiking app or a trusted source. Match name/number, endpoints, direction, version, update date, and key waypoints. Without reliable data, mark the route `Do not execute`.
- Do not generate a printed map, GPX, or turn-by-turn route by default. A supplied file may be reviewed, but file existence does not prove current legality, opening, or safety.

## 3. Required waypoints and user-app preparation

At minimum verify: searchable route name/number, start and end, each overnight hut/camp, critical junctions, passes/high point, reliable food/water, checkpoints, exits, transfers, and known hazard sections. Never guess coordinates.

Prioritise official maps/tracks and park/operator data, then reputable commercial mapping, licensed local guides/agencies, and recent tracks for cross-checking. One tourist track can reveal a problem but cannot alone prove current opening, legality, or safety.

Record version, date, source, whether totals include side trips, and conflicts. The user must download it offline and confirm that key waypoints display in their chosen app. The app is the primary navigation tool, but assess power, charging, offline behaviour, and a failure backup proportionate to the risk. Remote routes may justify a second device, official paper map, compass, or legal satellite communicator; do not require every item for every walk.

### Reviewing a user-supplied track

Accept a route link/ID, GPX/KML/FIT file, app screenshots, or waypoint list. Then:

1. identify source, name/number, version, download date, direction, and season; retain uncertainty for unknown provenance;
2. extract distance, ascent, elevation, endpoints, and waypoints where possible, and cross-check against official/park or mature route sources;
3. inspect endpoint offset, gaps, implausible straight lines/jumps, elevation spikes, wrong branches, reverse-direction effects, closure, private land, restricted areas, or unverified shortcuts;
4. match huts/camps, water, checkpoints, passes, hazards, exits, and transfers to the correct current route version;
5. combine permit, construction, weather, season, daylight, ability, and rescue conditions, then return `Usable / Conditionally usable / Do not use` with corrections and rechecks;
6. remind the user to finish offline preparation and visually inspect the route in their app. Never describe this review as a safety certification.

If the file format cannot be read or a link is login-restricted, state the audit gap and request visible screenshots, source page, or waypoint data.

## 4. Difficulty breakdown

Do not rely only on easy/moderate/hard. Separate:

- **Fitness**: distance, ascent, total time, continuous climb;
- **Technical**: surface, scrambling, climbing, snow/ice, crossing, navigation;
- **Exposure**: drop-offs, narrow ridges, rockfall, fear-of-heights consequence;
- **Environment**: altitude, temperature, wind, sun, water, signal;
- **Consequence**: exits, rescue difficulty, missed-transfer impact.

Use a current-condition colour with a reason:

- `Green`: status verified and matches ability, with normal preparation still required;
- `Yellow`: conditional departure with conservative handling or a pre-departure recheck;
- `Red`: do not execute under current conditions; provide an alternative.

## 5. Route card

| Field | Required content |
|---|---|
| Route type | Loop/out-and-back/traverse and transfer need |
| Start/end | Searchable local names and reliable location links |
| Distance/ascent | Value or range and source |
| Elevation | Start, high point, and altitude-risk relevance |
| Time | Official/source time, user-adjusted estimate, and buffer |
| Terrain | Hardest section, exposure, crossings, snow, or navigation |
| Track data | Source, name/ID, update date, and offline status in the user's app |
| Exits/turnaround | Exact locations, latest turnaround, and failed-plan return |
| Supplies | Reliable water, toilets, shelter; seasonal status verified |
| Communication/rescue | Signal expectation, emergency number, registration/check-in |
| Permits/restrictions | Booking, fee, pets, camping, fire, drone, etc. |
| Payment/cash | Ticket, lodging, food, charging, guide, and evacuation needs |
| Current risk | Green/yellow/red with evidence |

## 6. High-level structure and turnaround

Summarise only segment distance, ascent, typical time, key junctions, and hazards needed for safety and schedule. Do not duplicate turn-by-turn navigation from the user's app.

Calculate a personal turnaround time from sunset, weather window, descent speed, transfer, and weakest traveler. Turn back when a predefined health symptom, weather deterioration, unclear route, or progress threshold occurs; “almost there” is not an exception. A traverse needs a failed-transfer plan, and a water crossing needs a high-water exit.

## 7. Overseas trek checks

Route geometry remains in the user's app. Give planning space to access, legality, safety, insurance, medical support, accommodation, food/water, communication, payment, equipment, and emergency response.

### Permits, legal route, guide

- Verify national/park/local/restricted-area permits, checkpoints, registration, required guide/agency or party size, and authorised entry/exit.
- State applicant, lead time, physical/electronic documents, photos, payment, office holiday effects, and conflict between authorities.
- Recheck destination-specific rules for the actual year and valley/region; never reuse an old Nepal TIMS, restricted-area, or guide rule without current verification.

### Altitude, health, and itinerary

- List daily start, high point, sleeping elevation, sleeping-elevation gain, and acclimatisation days.
- Assess altitude by exposure and ascent rate, not general fitness.
- Give general thresholds for stopping ascent, descending, and calling rescue without diagnosing or prescribing.
- Verify route-relevant medical posts, capable referral facilities, transfer method, realistic access, and emergency contacts; a distant city hospital name is insufficient.
- Recommend travel-medicine or qualified-clinician advice for personal conditions, medication, vaccines, altitude prevention, diarrhea, and water risk. Verify import/airline restrictions for prescriptions and medical devices.

### Insurance, rescue, communication

- Verify the policy's exact activity, maximum altitude, trek/mountaineering definition, helicopter/ground search, medical care, and repatriation.
- Verify pre-authorisation, advance payment, designated assistance company, and actual local rescue flow.
- Research route-specific SIM/eSIM coverage, hut Wi-Fi, offline data, charging, and power outages.
- For remote, no-signal, or solo routes, assess a satellite communicator by risk and local legality.

### Lodging, food, water, and cash

- Verify hut/teahouse/camp season, booking, beds, heat, shower, charging, network, and bedding.
- State meal availability, dietary feasibility, water sources and treatment; a map water symbol is not a guarantee.
- Explain sanitation, bedding, cold, insects, and altitude-sleep reality plus necessary personal items.
- Mark the final reliable ATM/exchange/card point and the cash range beyond it; split storage.
- Provide fallbacks for power, network, QR, and foreign-card failure.

### Guides, porters, and local agencies

Use a legally compliant registered agency or licensed guide when required. Otherwise compare self-guided, guide, and guide+porter by route knowledge, language, permit handling, accommodation, load, weather decisions, first aid/communication, and rescue liaison. Let the user choose from the current ability and risk rather than automatically recommending or rejecting support abroad.

Verify registration, licence, responsibilities, insurance, inclusions, cancellation, and rescue process. Price the exact route, dates, people, days, and service mode in local currency plus a useful conversion. Explain porter load, equipment, lodging, insurance, and local tip norm; prefer providers with explicit labour protections. Do not use follower count as qualification or accept rescue arrangements involving fabricated injury or opaque commission.

### Season, access, and environment

Check monsoon, snow, pass conditions, fire, rockfall, avalanche, mountain flight/jeep cancellation, and road disruption. Add weather contingency days where consequences justify them. Verify waste, sanitation, fuel, camping, fire, wildlife, and religious/cultural rules, plus airline/customs restrictions on fuel, canisters, batteries, poles, satellite equipment, and medicine.

## 8. Equipment and final review

Make equipment route-, season-, lodging-, and law-specific, grouped as `Required / Conditionally required / Optional`. Do not substitute a generic outdoor-ten list.

Verify where essential gear can be bought, rented, repaired, fuelled, or replaced, price and season, and the final reliable supply point. Match clothing, footwear, waterproofing, insulation, lighting, power, water treatment, and first aid to precipitation, temperature, UV, mud/snow, crossing, altitude, charging, baggage transport, and hut bedding/heat.

Use only relevant checkpoints:

- `T-7 days`: permits, access, closures, broad weather;
- `T-48 hours`: local weather, thunderstorm, wind, snow, water/tide;
- `Before departure`: official notices, transfer, equipment, offline track, power, water, and trip notification;
- `At trailhead`: physical closure, visibility, group condition, and final turnaround time.

## 9. Overseas-trek execution card

| Module | Required conclusion |
|---|---|
| Track data | Reliable route/track exists, exact name/ID/source, and key waypoints are available offline in the user's app |
| Access | Start/end transfers, luggage, cancellation risk, and weather days |
| Permit/support | Current legal requirement and conditional self/guide/porter comparison with price |
| Insurance/rescue | Activity/altitude cover, search and medical transfer, authorisation/payment, and contact flow |
| Medical/altitude | Acclimatisation, stop/descend triggers, medical access, and travel-medicine preparation |
| Recovery | Hut/camp booking, heat, bedding, sanitation, charging, and network |
| Food/water | Supply, dietary limits, reliable sources, treatment, and hygiene risk |
| Communication/power | Coverage, offline data, battery, lost-contact plan, and satellite condition |
| Cash/payment | Final ATM/exchange point, required expenses, range, and split storage |
| Equipment | Route-specific required/conditional items, rental/repair, and carriage restrictions |
| Final decision | Weather, closure, turnaround, exits, notification, emergency numbers, and `Feasible / Conditionally feasible / Do not recommend` |

Unless the user explicitly requests a review of a supplied track, do not spend the guide on generating maps, GPX, or detailed navigation.
