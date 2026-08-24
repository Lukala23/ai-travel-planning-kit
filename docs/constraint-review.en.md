# Travel-planning constraints: section-by-section review

[中文版](constraint-review.md)

> This is a historical record of the section-by-section rule review, not a runtime authority or a file to upload for every trip. Current loading is defined by [Document Architecture and AI Loading Principles](architecture.en.md) and each language's `SKILL.md`.

## How to review a future change

Review one section at a time:

```text
Review section [number]:
- Keep: ...
- Change: ...
- Add: ...
- Remove: ...
```

After confirmation, update this review, the authoritative execution rule, and the trip brief only when the change is genuinely per-trip input.

## Review status

| Section | Topic | Status |
|---:|---|---|
| 1 | Attraction research and value screening | Confirmed 2026-08-13 |
| 2 | Accommodation, experiential stays, and local dining | Confirmed 2026-08-13 |
| 3 | Public transport, charters, unusual transport, payments, and connectivity | Confirmed 2026-08-13 |
| 4 | International entry, borders, and real local conditions | Confirmed 2026-08-13 |
| 5 | Route structure, pace, and fallbacks | Confirmed 2026-08-13 |
| 6 | Photography, priority shots, and useful light | Confirmed 2026-08-13 |
| 7 | Hiking, overseas treks, and route data | Confirmed 2026-08-13 |
| 8 | Museums, exhibitions, memorials, souvenirs, and local purchases | Confirmed 2026-08-13 |
| 9 | Verification, guide content, and final QA | Confirmed 2026-08-13 |
| 10 | Formal package, images, quick reference, and use | Confirmed 2026-08-13 |
| New | Air travel, flight search, and booking timing | Confirmed 2026-08-14 |

## 2026-08-14 cross-module architecture update

- Remove `planning-principles.md` and the long-term preference index. Keep only minimal global operating boundaries in `SKILL.md`; research, route, safety, and overridable preferences live in their responsible references.
- When an executable conclusion is needed, a minimum trip-condition check states entry/permit, round-trip long-distance access, major unavoidable costs, and user assumptions; conditional proposals retain outstanding and recheck conditions even without an obvious blocker.
- `self-drive.md` is now a complete rental/road module covering contract total, vehicle protection/excess, fuel/charging, toll systems, winter equipment, traffic-side adaptation, border use, fatigue, assistance, penalties, and pickup/return evidence.
- New `health-and-medical.md` loads for sleeping/activity altitude around 2,450–2,500 m+, user health/medicine needs, or an authoritative risk screen; health planning is no longer confined to hiking.
- New and deliberately narrow `travel-insurance.md` loads in full only for mandatory proof, special activity/altitude, remote evacuation, planned card coverage, or an explicit question; the traveler manages whole-trip insurance.
- New `air-travel.md` separates flight search and booking strategy from public transport and owns the actual-origin air chain, complete cost, comfort, connection risk, and a tracking protocol.
- Former `international-travel.md` is split into `entry-and-transit.md` and `international-operations.md`, so a narrow visa/transit question does not load payment, connectivity, and tipping guidance.
- Task scope, verification strength, and delivery form are independent. OpenAI uses explicit invocation by default; module loading is model-followed soft routing with debug output and behavioral cases for testing.

---

## 2026-08-14 new specialist module: air travel, flight search, and booking timing

- Plan the complete outbound and return chain from the actual origin. Compare nonstop, protected connections, and useful open-jaw structures first; consider another gateway only when complete cost, time, and risk materially improve.
- The origin-neutral English edition uses airline-direct, reputable local/regional channels, and metasearch appropriate to the traveler’s sales market. The Chinese edition separately prioritizes accessible China-market channels.
- A gateway option includes feeder transport, airport change, hotel, baggage on every ticket, self-transfer, missed-connection, and effort cost. A cheaper long-haul segment alone does not prove a cheaper complete journey.
- Normalize complete tax-inclusive cost, required extras, door-to-door time, comfort, baggage, connection protection, fare rules, and support. Keep only genuinely different balanced, lowest-complete-cost, and more-comfortable/lower-risk finalists.
- Do not give a universal “20/100 days ahead” answer. Use route-level current fare, intelligible low-fare calendar/trend, recorded snapshots, date rigidity, holidays, and alternatives to return `Buy now / Set alerts and observe / Wait for trip conditions / Cannot yet assess`. An observation plan needs a complete target price, buy trigger, latest decision date, and checkout repricing.
- When platforms or route-level history are inaccessible, preserve uncertainty and give exact searches instead of inventing a trend. Never book, log in, redeem, or enter traveler/payment data without explicit authorization.

This module is confirmed as origin-neutral in English. The Chinese edition remains optimized for departure from China, with shared safety and comparison logic rather than literal wording.

---

## 2026-08-24 rule update: transactional sources, fact ledger, lodging quality assessment, and the offline mobile page

- Transactional-fact source constraint, added to `source-verification.md`: prices, inventory, bookable status, and schedule times may be verified only on transactional channels (the live page of a bookable or ticketing platform, an official reservation or ticketing system, official timetables). Blogs, forums, and social media are content sources that may supply only a background reference range labeled not purchasable. Every quoted figure carries a source level (`quoted channel price at check time` / `background reference range`), and the two classes are never mixed in one comparison table. The air and lodging modules reference the same grading.
- Fact ledger and reuse, added to `source-verification.md` and the `SKILL.md` operating boundary: the conversation about one trip maintains a fact ledger (content + source + check date + validity class); later questions reuse matching, unexpired entries instead of re-searching. Access failures are recorded as well and are not retried within the session. Where the host supports persistence, the ledger is saved as `trip-facts.md` and merged into the formal package as the recheck baseline for the T-7 / T-48 update.
- Comprehensive lodging quality assessment, replacing section 7 of `accommodation.md`: platform scores are a weak pre-screen only. Shortlisted properties are assessed through four layers: score screening, review mining (mid-band negative reviews of the target room type from the last six months, tallied by type with recurring hardware issues as a strong negative signal, plus reviewer profiles), cross-platform triangulation, and a fixed six-dimension scorecard output.
- Public transport now verifies by how digitized the destination's information is, in `public-transit.md`: mature markets verify official sources directly; in fragmented markets, items still unresolved after cross-checking are marked `Uncertain` with an on-site confirmation method and a fallback.
- Payment and tax/tip responsibility convergence: general payment-method selection, payment backup, cash exchange, and tax and tip classification are owned by `international-operations.md`; `public-transit.md` keeps transit acceptance and fare products, and `dining.md` applies the classification to dining.
- The offline mobile page is promoted to a first-class deliverable, with `deliverable-package.md` restructured into 10 sections: `01_OFFLINE_MOBILE.html` becomes the primary on-site deliverable (a single offline web page with tab navigation, day-by-day timelines, cross-links to place details, searchable text, and a gradient fallback for missing background images), generated from the `assets/trip-mobile-template.html` template. New image specifications apply (one cover plus optional daily backgrounds, JPEG 800–1200 px, at most 150KB per image and 3MB in total, source order own photos > CC-licensed > official imagery, prefer missing over wrong). The quick-reference PDF becomes an on-demand print counterpart.
- Trigger declarations were added at the top of `hiking-rules.md` and `destination-research.md`, stating when each file is read.
- Six routing cases were added to `tests/routing-cases.tsv`: lodging quality assessment, fact-ledger reuse, and offline-page generation in Chinese, mirrored by three English cases.

---

## Section 1: attraction research and value screening

### Confirmed behavior

- Define the destination boundary: city, region, and realistic day-trip radius.
- Search classic, lesser-known, seasonal, reservation-only, and trip-specific candidates together.
- Search broadly internally, but show only deduplicated, screened, and graded results.
- Do not treat viral lists, rankings, ratings, likes, or check-in counts as evidence of travel value.
- For international places, search official English names, local-language names, and map-searchable names.
- Remove aliases, sub-attractions presented as separate places, and repackaged duplicate experiences.
- Evaluate each candidate in plain terms: why it matters, why it fits this trip, practical friction, timing, cost, and failure fallback.
- “Fit for this trip” must connect to current goals, days, travelers, budget, pace, transport, or hard constraints. Use `Cannot yet assess` when data is insufficient.
- Verification status describes evidence, not value. Show `Verified / Recheck before departure / Uncertain` only when it affects a choice.
- Photography is a light ranking factor, not a mandatory field or the only value. Expand angle, light, and roadside opportunities only when useful.
- Raise priority when a place has independently judged high photographic and social-sharing value and the extra time, money, effort, safety, crowd, and companion cost is manageable. Judge location identity, visual narrative, and real reproducibility—not platform popularity.
- Famous is not automatically essential; obscure is not automatically worthwhile.

### Detect marketing noise

- Use social platforms and lists to discover candidates, then cross-check ordinary recent photos, detailed accounts, negative evidence, map scale, and current operations.
- Look for repeated promotional copy, one filtered angle, sponsorship or rebate, sudden concentrated scores, and imagery dependent on drones, long lenses, or heavy editing.
- Compare actual experience and reasonable dwell time against queues, tickets, detour, and extra spending.
- Syndicated copies of one campaign are not independent sources.
- Label only observable `high marketing risk`; do not accuse manipulation or fraud without evidence.

### Grades

- `A Core experience`: highly suitable, difficult to replace, and worth structuring the route around.
- `B Strong recommendation`: worthwhile but selectable by geography and time.
- `C Conditional option`: add when nearby, weather is suitable, energy remains, or a specific interest applies.
- `D Do not include`: marketing outweighs experience, cost is poor, conditions fail, or a materially better alternative exists.

Show only famous or high-marketing-risk D items the user may reasonably ask about, not every rejected candidate.

---

## Section 2: accommodation, experiential stays, and local dining

Accommodation and meals are route components. Every overnight trip requires active accommodation research. Every route crossing a main meal requires an executable food plan, not two disconnected lists at the end.

### Accommodation research

- Compare meaningful areas from attractions, transport, and urban structure before searching exact properties; recalculate the route after selection.
- Use official property sites, Trip.com/Ctrip, Booking.com, Agoda, Expedia, Hotels.com, Google Hotels/Maps, and effective local platforms as appropriate. Cross-check finalists on two bookable channels and the official channel when possible.
- Normalize dates, travelers, room and bed type, view, breakfast, cancellation, taxes, and currency. Count member or app-only prices only when the user qualifies.
- Evaluate daily attraction travel, airport/station connection, central wandering, immediate surroundings, late return, local food, street walkability, noise, safety, and daily convenience.
- Use true stay cost: room, taxes, cleaning/service/resort fees, breakfast, deposit, exchange, payment fees, and location-induced transport.
- Do not recommend from one platform rank. Check recent room-specific reviews, ordinary guest photos, repeated complaints, and the real entrance.
- Give one clear overall recommendation plus meaningful alternatives for price, transport, city life, or lower risk. Do not force a fixed-length list.
- For an existing booking, assess fit and route, dining, and budget effects; replace it only for a major problem or explicit request.

### Experiential stays and moving properties

- Distinguish functional bases from stays that are experiences through views, architecture, hot springs, history, local life, photography, or social-sharing value.
- Avoid moves with no return, but do not make “fewest hotel changes” the top priority. Recommend a special night or multiple bases when experiential, route, photography, or recovery benefits justify the price difference, packing, checkout, luggage, waiting, and weather-failure risk.
- For weather-dependent scenic hotels, verify exact room, orientation, floor, obstruction, public/private viewing point, date-specific light, weather dependency, and whether marketing photographs are reproducible.
- Prefer cancellable prices while key conditions are unstable. Show non-refundable savings, deadline, and maximum loss so the user decides.

### Local food in the daily route

- Research everyday local dishes, specialties, snacks, markets, and seasonality before selecting exact venues.
- Prefer strong evidence of local clientele, regional authenticity, stable recent output, and fair value. Fine dining is not the default; street-side shops can rank equally.
- Use short-video and lifestyle platforms only for discovery. Google Maps is useful but biased by visitor mix, marketing, and scoring. Cross-check local-language reviews, local booking/review platforms, current menus, local sources, and ordinary recent photos.
- Do not claim “locals' favourite” from marketing copy. Use explainable language such as “strong evidence of local clientele.”
- Connect breakfast to the accommodation or first stop, lunch to morning/afternoon geography, and dinner to the last node, evening walking, and safe return. Count arrival, queue, ordering, and eating time.
- A high-value or reservation-critical meal may anchor the route. Do not cross a city for an ordinary check-in meal. Give a same-area primary and backup for important meals; for others, a dining zone and selection rule can be better.
- Verify signature dishes, per-person spend, tax/service, hours, booking, payment, dietary needs, and food-safety signals. Do not reject a strong venue for plain decor or ignore taste and value because it photographs well.

---

## Section 3: public transport, charters, unusual transport, payments, and connectivity

Separate convenience, fares and travel cards, payment and exchange, mobile data, and non-fixed-price transport.

### Convenience

- Do not say merely “transport is convenient.” Calculate door-to-door time, walking, transfers, frequency, first/last service, entrances/exits, luggage, storage, accessibility, late return, and failure cost.
- Verify fares, construction, suspension, and interchange rules for the exact operator, line, and product.

### Tickets, passes, and travel cards

- Compare single tickets, contactless bank card/phone, day or multi-day pass, tourist card, and anonymous transit card against this trip's actual segments and travelers.
- Before buying a card, verify sales points, purchase fee/deposit, initial balance, top-up, balance check, refund, validity, residual balance, and one-card-per-person rules.
- Do not buy a card for appearances when direct card/phone payment receives the same transfer or fare-cap benefit.
- A visitor or anonymous card is reasonable when it genuinely saves money or friction without a local identity account. It is separate from a SIM/eSIM.

### Payments, physical backup, and exchange

- Cash, physical cards, and digital wallets are normal candidates. Start by verifying already configured, reusable methods such as Alipay, WeChat Pay, Apple Pay, or Google Wallet/Google Pay, then compare them with cards and cash for exact acceptance, cost, reliability, and failure consequence. This is an overridable convenience preference, not a fixed ladder.
- A physical card or cash may lead when it is more reliable, cheaper, or better covered in critical scenarios. Recommend a destination-specific wallet/app only when it is unusually useful, or lacking it would cause material inconvenience, price loss, or loss of access, and those gains outweigh registration, identity, local-number, card-link/top-up, language, refund, and balance-exit burden.
- Verify exact phone, linked card, acceptance context, fees, limits, connectivity, and refunds. A logo for Alipay, Google Wallet, or Visa is not a guarantee.
- Physical cards and cash can be prepared, but estimate real cash needs before comparing home exchange, legal exchange offices, and ATM spread, fixed fee, withdrawal fee, DCC, limit, and leftover-cash loss.
- Primary and fallback payment must not depend on one phone, card, or account. State actions for battery loss, fraud controls, SMS failure, decline, and insufficient balance.

### International connectivity

- Treat data as infrastructure for navigation, ride-hailing, tickets, translation, payment, and emergency contact.
- Compare Chinese-carrier roaming, manufacturer travel data/virtual SIM, travel eSIM, local SIM/eSIM, and pocket Wi-Fi for the exact phone. Verify bands, coverage, throttling, hotspot, local number/SMS, activation, and total cost.
- Use a local SIM when a number is required, coverage is clearly better, the stay is longer, or total cost wins. Save maps, accommodation addresses, tickets, and emergency contacts offline.

### Taxis, ride-hailing, transfers, and charters

- For airport transfers, intercity trips, day charters, and other non-fixed-price segments, specify endpoints, time, travelers, luggage, and vehicle; give a local-currency range and useful home-currency conversion.
- Prefer official fixed fares/meters, current route estimates in ride apps, written licensed-company quotes, and accommodation transfer quotes. Use traveler reports mainly to detect scams. With insufficient evidence, obtain two or three like-for-like written quotes instead of guessing.
- Label fixed fare, meter estimate, app surge, or charter quote; separate tolls, airport, parking, waiting, luggage, night, empty return, driver food/lodging, and tip.
- Before a negotiation, provide local-language written confirmation of route, date/time, vehicle, whole-vehicle total rather than per-person price, inclusions, extras, payment, and cancellation.
- Confirm pickup point, plate, vehicle, driver, and order. Do not accept unjustified app cancellation, off-platform trade, vehicle switch, or new fare. Save order fare, plate, support, and destination offline.
- Warn about risks for the exact city, airport, route, and time: fake drivers, meter abuse, detours, currency switching, car-to-per-person repricing, fabricated fees, off-platform surcharges, no change, or luggage pressure. Do not label an entire country by development level.
- Keep passport, phone, cash, medicine, and essential electronics with the traveler. If a driver changes the price or holds luggage, avoid physical confrontation; move toward a public monitored place and contact the platform, station/airport security, hotel, tourist police, or police. Preserve plate, order, and demand evidence where lawful.
- Save verified help channels and a second transport plan offline. Do not guarantee platform, police, or refund success.

### Carriages, riding, and other unusual transport

- Treat carriage, camel/horse riding, tuk-tuk, rickshaw, motorcycle hire, traditional boat, and similar products as both transport and possible experiences. They still require price units and scam checks.
- Confirm whole vehicle/boat versus person, hour, circuit, or one-way; identify separate return, waiting, photographs, feed, guide, ticket, and tip.
- Confirm route, duration, finish point, and total in writing. Warn about “free trials,” forced extensions, per-person repricing after arrival, forced photo/feed purchase, or demands in an isolated place.
- Check helmets and passenger rules for motorcycles; capacity, life jackets, conditions, and night operation for water; heat, overloading, injury, emaciation, lameness, breathing distress, and handling for animals.
- Local character never overrides safety, legality, or animal welfare; offer a regulated alternative when conditions fail.

---

## Section 4: international entry, borders, and local conditions

Load this section only for international, cross-border, or international-transit travel. Recheck against the travel document's issuing jurisdiction, complete transit chain, duration, and purpose.

### Entry, transit, and customs

- Verify visa/waiver, ETA/e-permit, arrival forms, passport validity and blank pages, permitted stay, and return/funds/accommodation evidence.
- Distinguish through-ticket versus separate tickets, immigration, baggage reclaim, airport changes, transit visas, minimum connection, and conservative buffer. Airline boarding does not guarantee border admission.
- Check declarations and restrictions for cash, food, medicine, plants/animals, camera equipment, drones, satellite devices, and outdoor equipment. Ask only for decision conditions, never document numbers.
- Use the competent authority plus another independent source for high-risk or irreversible facts, and schedule a final recheck.

### Normal preparation and reported unofficial demands

- Check in advance for e-visa/ETA, arrival or customs forms, online check-in, document pre-clearance, and applicable official e-gates or registered-traveler programmes. These are preparation, not payment for special border treatment.
- Do not make airport/airline fast track, concierge, or connection assistance a mandatory research item. Investigate only on request or when a tight connection or mobility need creates material value.
- Separate check-in, security, lounge, baggage, and airport escort from immigration and customs. Commercial services cannot guarantee admission, bypass customs, or buy public-official favour.
- Verify official visa, entry/exit, and visa-on-arrival fees, channels, and receipt requirements.
- Warn in advance when official advisories and several credible recent sources repeatedly report unofficial “fees,” “tips,” or “acceleration payments” at a specific checkpoint or process. State that they are not normal charges; do not label a country from one or two posts.
- Do not advise paying border, customs, police, or other public officials. When safe, ask politely for the charge name and official basis, request an official desk/electronic channel and receipt, and ask for a supervisor if necessary. Do not argue or fight. Protect person and documents, then contact tourist police, the port operator, or consular support after leaving danger and preserve lawfully obtained evidence.

### Tips, taxes, and surcharges

- For restaurants, hotels, drivers, guides, porters, baggage, doormen, and concierge, state whether tipping is customary or voluntary, normal amount/percentage, timing, and whether an existing service fee normally replaces it.
- Separate statutory VAT/sales tax, mandatory service charge, city/tourist/accommodation tax, resort fee, cover/bread/water fee, minimum spend, card surcharge, platform fee, and voluntary tip.
- For each, give menu/contract/official basis, amount, mandatory status, whether it is usually included, collector, payment time, and receipt availability.
- Do not identify an unexplained 5% or 10% item from percentage alone. Ask for an itemised bill, name, mandatory/optional status, and menu, booking, or regulatory basis; compare original price and ask a manager or platform to explain or correct it.
- Before card payment, match terminal amount and currency to the bill and avoid accidental duplicate tips. Prioritise safety rather than universal confrontation. Preserve bill, booking, and payment evidence for the appropriate consumer authority, tourist police, platform, or issuer dispute route.

### Other real operating customs

- Research industry practice and current conditions that affect the route, and separate official law, broad custom, and individual reports.
- Check weekends, religious days, siestas, festivals, strikes, booking norms, document carriage, accommodation registration, dress, alcohol, public etiquette, photography, and gender-related rules.
- Verify deposits, bargaining, cash change, scams, and surprise pricing by city and scenario; do not infer from a neighbouring country.

### Safety and emergency preparation

- Combine official advisories and local authorities for crime, borders/restricted areas, protest, curfew, scams, roads, and natural hazards. Avoid countrywide labels when risk is route-specific.
- Verify easily missed offences involving medicine, government/military photography, religious sites, drones, alcohol, electronics, or public conduct.
- Prepare local emergency numbers, tourist police, insurance assistance, medical entry point, consular support, and lost-document process offline.
- Do not sensationalise, but do not minimise authority warnings. Offer another area, route, or date condition when risk clearly exceeds value.

Every international trip receives one compact operating and safety card covering only relevant entry, credible unofficial-charge reports, bills and tips, payment/exchange, transport scams, important laws/culture, emergency help, and recheck times.

---

## Section 5: route structure, pace, and fallbacks

### Route logic before a timetable

- Explain geographic grouping, order, and trade-offs before precise times.
- Protect the trip's most important and irreplaceable experiences; do not maximise attraction count.
- Explain why important candidates were left out: time, duplication, detour, booking conflict, poor fit, or failed conditions.
- Map time is an estimate, not an arrival promise.

### Count the complete process

`visit + door-to-door travel + waiting/transfers + queue/security + storage/entrance + meals/rest + wayfinding + risk buffer`

- Deduct arrival formalities, baggage, immigration, city transfer, and check-in; protect checkout, luggage collection, and departure transfer.
- Use specific time models for large museums, hiking, light-dependent photography, destination meals, and hotel moves.
- Every day needs a real start, final endpoint, and reliable return to the base or hub.

### Default balanced sightseeing

- Do not ask users to quantify a trip only as relaxed/balanced/intense.
- Default normal sightseeing cities to `Balanced sightseeing`: cover as many genuinely valuable places as time, cost, ability, opening, and transport allow while preserving meals, rest, complete experiences, and safe return.
- Switch to `Holiday mode` for explicit rest/resort intent and `High coverage` only on explicit request.
- Confirm intensity through start/end time, core experience blocks, walking/standing load, earliest/latest fixed booking, and consecutive demanding days.

### Buffer by consequence, not percentage

- Do not apply a fixed 10% or 20% buffer.
- Give expensive performances, timed interpretation, non-refundable bookings, flights/intercity transport, last services, return day, and other high-loss nodes enough margin for actual uncertainty.
- Put buffer in the timetable; do not append “leave early.”

### Season and near-term weather

- During initial design, check daylight, typical precipitation, heat/cold/wind/fog, snow/flood/typhoon seasons, sea state, and seasonal closure. Climate normals are not forecasts.
- In a useful forecast window, update with local forecasts and warnings. Typical city checks may use T-7 and T-48; high-risk outdoor/water/volatile areas may need previous-evening and same-day checks.
- State which nodes weather affects and the trigger to retime, swap days, move inside, shorten, or cancel. Do not execute against official closure or danger warnings.

### Stability levels and fallbacks

- `Hard anchor`: booked transport, timed ticket, interpretation, performance, last admission.
- `Core experience`: protect first, but adjust with opening and ability.
- `Movable node`: retime, replace within the area, or shorten.
- `Add only with spare capacity`: never promise it in advance.

Cut in this order instead of compressing meals, rest, movement, or safe return. Use executable fallback syntax: `trigger → first cut/change → replacement → new transport/time → downstream booking/return effect`. Do not generate three complete weather/energy/late-start plans by default; late-start is not a default scenario. Recalculate the whole route when dates, accommodation, transport, travelers, budget, or core goals change.

---

## Section 6: photography, priority shots, and useful light

- When the brief does not specify equipment, start from a phone and, at most, an Osmo Pocket or similar device. This is overridable, not a permanent traveler profile; current equipment and goals take priority.
- Prioritise composition, position, light, people placement, layers, and clean background; add equipment settings only when the trip explicitly includes other gear.
- Scan the whole route lightly. For core and ordinary popular sights with reproducible compositions, state where to stand, direction, orientation, people position, what to keep, and what to avoid.
- For high-travel-value but visually ordinary places, use `Record only` and a solid memory-photo method rather than inventing a masterpiece.
- Grade `Must shoot / Worth shooting / Record only / Not worth a photo detour`. Build full cards only for must-shoot and important worth-shoot points.
- Judge photographic and social-sharing value independently from platform popularity. Use place identity, spatial layers, light dependency, legal position, detour, waiting, visual memory, story across a set, and ordinary-visitor reproducibility.
- When both values are high and extra cost is manageable, raise route priority. When cost is material, show normal visit and photography-upgrade options.
- A priority card includes public position, subject, direction, foreground/composition, people placement, date-specific light, phone method, waiting, restrictions, and poor-weather fallback.
- Use official imagery, maps/satellite views, sun path, and multiple recent field sources. Label drone, long-lens compression, heavy editing, private positions, or special season.
- Treat truly light-dependent points as anchors; include strong bridge, street, trail, or transit shots along the route.
- Sunrise, blue-hour, and remote points require transport and safe return. If no point justifies a detour, say so.
- Provide one to three sourced real reference images for must-shoot and important worth-shoot points; add one when text cannot explain an ordinary landmark composition. Include source, creator/organisation when available, verification date, and what to learn.
- Early starts are acceptable for a genuinely worthwhile point when sleep, transport, weather, and safety are manageable. Long waits, major detours, or lost core experiences remain an optional photography upgrade.

---

## Section 7: hiking, overseas treks, and route data

### Ability and conditions first

- Pass an opening, permit, weather, terrain, daylight, transport, ability, and equipment gate.
- Plan for the least capable participant using recent completed routes, comfortable distance/ascent, technical terrain, exposure/injury, altitude experience, navigation skill, and existing equipment.
- Compare candidates with incomplete data, but do not declare them suitable. Ask only what changes safety, permit, or route structure.

### Never guess route data

- Distance, ascent, altitude, time, coordinates, and GPX require reliable sources.
- Separate fitness, technical, exposure, environmental, and consequence difficulty; add green/yellow/red risk with reasons.
- Distinguish one-way, return, circuit, and traverse; do not confuse elevation with cumulative ascent.

### User-managed tracks, key points, exit, and turnaround

- The user downloads and manages routes in their hiking software. Do not generate printed maps, GPX, or turn-by-turn directions by default.
- Reliable track and key points are a safety gate. Confirm route name/number, endpoints, version/date, daily lodging, junctions, passes, reliable water/supply, checkpoints, exits, transfers, and hazards.
- Do not recommend execution without reliable data, and never fabricate a replacement track.
- Prefer official maps/GPX, then cross-check licensed local operators, credible maps, and recent tracks. One visitor track cannot prove opening, legality, or safety.
- Require offline download and visible waypoints before departure. Recommend power, second device, official paper map, compass, or legal satellite communication according to actual risk—not mechanically all of them.
- Do not offer unverified shortcuts, trespass, private land, or closed routes.
- After the user downloads a route, review link/ID, file, screenshot, and waypoints for source/version, distance/ascent, endpoints, breaks/jumps, wrong branches, closures/restrictions, huts/water, exits, and transfers. Return `Usable / Conditionally usable / Do not use`; never call it a safety certification.
- Give personal turnaround time and triggers for worsening weather, unclear route, slow progress, preset symptoms, or missed transport. “Almost there” is not an exception.
- Traverses, crossings, coast, high mountains, and transfer-dependent routes need scenario-specific exit plans.

### Overseas trek focus

- Spend more effort on access transport, luggage/transfers, permits, weather contingency, safety, insurance, rescue, medical care, lodging, food/water, communications, electricity, cash, and equipment than repeating every turn.
- Recheck guide/agency mandates, parks/restricted permits and checkpoints; daily high/sleep altitude, ascent rate, acclimatisation, and descent triggers; exact activity/altitude/rescue insurance and payment/pre-authorisation; medical and evacuation access; SIM/eSIM, offline maps, charging, outages, satellite rules and rescue process; hut/teahouse/camp booking, heating, bedding, food, water and hygiene; last ATM/card point and cash fallback; guide/porter qualification, insurance, load, pay, tip and labour protection; monsoon, snow, fire, avalanche, pass and mountain transport cancellation; waste, camping, fire, wildlife, religion, and air carriage of equipment.
- Do not transfer domestic expectations about trail data, rescue, mobile payment, or lodging to another country. Recheck Nepal-style permit, TIMS, guide, and insurance rules every time.

### Guides and porters

- Use a compliant licensed guide or agency when legally required. When optional, do not automatically include or reject them because the trip is abroad.
- Compare self-guided, guide, and guide+porter benefits for route knowledge, language, permits, lodging, load, weather, first aid/communication, and rescue contact against the current users and risk.
- Verify cost for exact route, date, travelers, days, and service. Separate permit, park, transport, lodging, meals, wages, insurance, equipment, taxes, platform fee, and tip; label per-person/group/day inclusions.
- Compare registration, language, scope, communication/first aid, cancellation, rescue responsibility, porter load, and labour protection—not followers or lowest price.
- Obtain multiple comparable written quotes when no public fare exists.

Deliver an overseas-trek execution card covering route-data readiness, access, permits, guide/porter choice, insurance/rescue, medicine/altitude, lodging/recovery, food/water, communication/power, cash/payment, equipment, weather, and abandon conditions.

---

## Section 8: museums, exhibitions, memorials, souvenirs, and local purchases

Museum planning can shape the entire trip. Souvenir advice is a light purchasing aid and must not dilute the first task.

### Museums as route anchors

- Lightly scan museums, galleries, memorials, site museums, and specialist venues for every destination; search more deeply in capitals, major cities, and historic/cultural cities. Include a genuinely important fit even if it is small or the city is not known for museums.
- When museums form core destination value, allocate suitable days and plan them with accommodation, transport, and food even if the user did not name each one. A single high-value small museum can anchor hours or half a day.
- Search national/general, art, archaeology/history, specialist, memorial, site, house, university, strong temporary, and high-value small museums.
- Grade `Core anchor / Important addition / Conditional candidate / Do not include`; museums are neither only rain fallbacks nor all mandatory because famous.

### Value behind fame

- Separate institutional fame, building fame, total collection, and what is actually public now.
- Verify whether signature objects are on display, original or replica/reconstruction, whether core galleries are open, and whether advertised content needs another ticket or is inaccessible.
- Compare uniqueness, display/narrative quality, trip fit, overlap, language barrier, queue, ticket, effort, and total time.
- Downgrade a famous museum with weak display, closed core, severe language barrier, or high duplication using concrete evidence—not “boring.”
- Search local-language cultural listings, museum associations, universities/research bodies, and professional sources for smaller venues; do not recommend something merely for obscurity.

### Language access and guides

- Treat the traveler's preferred interpretation language as a planning condition. For the original Chinese-first profile, verify Chinese labels, maps, audio, apps, subtitles, scheduled tours, and private interpretation; a translated website does not prove in-gallery support.
- When official support is weak, prepare a concise pre-visit narrative, priority galleries/objects, local and translated names, locations, significance, details to inspect, and confusing terms. Offline translation is supplementary, not authoritative art-history or archaeology interpretation.
- Compare official human tours, official audio/app, lawful qualified private guides, and a pre-read+self-guided visit.
- Return one clear conclusion: `Hire a guide / Official audio is sufficient / Pre-read then self-guide / Depends on budget or interest`, with reasons.
- Verify price by date, travelers, museum, language, and duration; distinguish per-person/group/hour and separate ticket, guide, language surcharge, headset, tax, platform fee, and tip. Check qualification, meeting point, coverage, entry accompaniment, ticket responsibility, cancellation, and lateness. A private guide does not automatically skip queues; with no reliable public price, provide enquiry channels and wording.

### How to visit, not only how to enter

- Offer genuinely different highlights and deep routes according to scale and interest. Do not split tiny museums mechanically or pretend to complete a giant museum.
- Design around entrance, floors, gallery links, one-way flow, lifts/stairs, congestion, and exit; protect irreplaceable or early-closing galleries.
- For priority galleries/objects, give translated name, searchable local name, location, importance, details to notice, dwell time, and language aid.
- Count security, storage, orientation, queues, rest, toilets, food, photography, and shop; account for standing and information fatigue across multiple museums.
- Provide an executable shortened route for missing objects, closed galleries, late arrival, or low energy.
- Continue to verify entry, identity/booking, permanent/temporary/branch tickets, closure, last admission, security, storage, re-entry, accessibility, photography, and rotations. Use priority museums as half/full-day anchors with transport, meals, surrounding district, and return.

### Souvenirs and local purchases

- Keep this lightweight, not a collecting or manufacturing audit. Look for locally distinctive, interesting, portable, reasonably priced items such as magnets, postcards, stationery, collection-derived products, small textiles, or compliant packaged food.
- Separate personal mementos from gifts and suggest `low-cost many-recipient / mid-range quality / a few special pieces` with local and useful home-currency values.
- Compare museum shops, maker stores, markets/book/design shops, supermarkets, and airports for local character, fair price, route convenience, and selection. Do not default to valuable collectibles.
- Handmade, rare, and hard-to-copy qualities are bonuses, not gates. For ordinary low-cost items, judge design, locality, price, and portability rather than meaningless production details.
- Keep practical warnings for fragility, shelf life, food quarantine, customs, and protected materials. Investigate provenance/authenticity only for higher prices or explicit handmade, limited, antique, or origin claims.

---

## Section 9: verification, guide content, and final QA

- Deliver one directly usable main guide by default: conclusions and trade-offs first, then route, accommodation, dining, transport/payment, cost, booking, photography, risk, and fallbacks.
- Include only relevant modules. Expand automatically for safety, law, expensive non-refundable decisions, complex museums, or overseas treks; keep ordinary low-risk content concise.
- State dates, travelers, budget, confirmed items, and key assumptions at the top; preserve missing information as unknown or conditional.
- Recheck opening, price, booking, transport, visa, road/trail, weather, payment, accommodation inventory, restaurant status, and exchange rate for the current task.
- Use at least one competent authority or direct operator for safety, law, and expensive non-refundable items. Add an independent second source when wording is ambiguous, evidence conflicts or is inaccessible, or the downside is severe and confirmation is practical. Use visitor evidence for field experience and issue discovery.
- Put direct sources and verification dates beside decision-critical claims. Keep only a short key-evidence table at the end.
- Use `Verified / Recheck before departure / Conditional / Uncertain / Planning judgment`. These are evidence states, not attraction grades.
- Preserve source conflicts and applicable dates. Unknown is better than invented certainty.
- Generate task-specific checkpoints at `Now / T-30 / T-7 / T-48 / Same day` only once the trip is executable; prioritise admission failure, missed transport, no payment, trail risk, and major loss, with owner and timing.
- Before delivery, silently check date/weekday, time zone, currency/unit, accommodation total, tax/service/tip, payment fallback, bookings/last admission, daily return, critical buffers, weather fallback, and major transport, plus relevant dining, photography, museum language, negotiated-transport scam, overseas safety, track, and souvenir rules. Show only unresolved user actions, not the entire internal audit.

---

## Section 10: formal package, images, quick reference, and use

Use one authoritative content source to derive multiple views.

| File | Purpose |
|---|---|
| `00_START_HERE.md` | Version, latest verification, file use, and update instructions |
| `01_TRIP_QUICK_CARD.pdf` | Phone-first daily timeline, addresses, entrances, bookings, payment, return, emergency |
| `02_COMPLETE_TRAVEL_HANDBOOK.md` | Source of truth for editing, review, and AI use |
| `02_COMPLETE_TRAVEL_HANDBOOK.pdf` | Searchable mobile reading, sharing, normal printing, or one-file AI upload |
| `media/` | Actual photography references, entrance/transfer images, and necessary diagrams |

- Add ZIP when the whole package must be preserved. Do not generate offline HTML unless interactive mobile navigation is explicitly useful.
- Use a clickable contents page, PDF bookmarks, fixed tags, a trip overview, and “what to do now.” Organise the body by day with a compact overview followed by place, entrance, transport/payment, meal, photo, booking/risk, return, and fallback.
- Include specialist chapters only when relevant. End with language/location/phrase index, key evidence, and departure rechecks. Avoid duplicating facts; use links and references.
- Put trip dates, version, generation date, and latest verification date in every file. Edit Markdown first, then rebuild PDF and quick card.
- Use one to three sourced photography references only where they explain a real shot; use annotated entrance/transfer images only where wayfinding is genuinely difficult. Every image needs source, verification date, explanation, and text alternative.
- For international locations, provide translated name, local official name, official English name when different, copyable map name, local-script address, and the actual labels seen at entrances, exits, floors, platforms, and counters.
- Prepare a small set of relevant bilingual/local-language phrases for driver destination and total, declining extras, itemised charges, hotel check-in, dietary needs, and emergency help. Mark complex machine translation that lacks proper verification.
- Keep the quick card action-only and day-by-day rather than forcing one sheet. PDFs need selectable text, heading structure, bookmarks, internal links, and image descriptions.
- Markdown is normally better for precise AI editing. Upload Markdown plus `media/` when multi-file context is supported; otherwise use the complete PDF and require live rechecks for dynamic facts.
- Create `03_PRINT_EMERGENCY.pdf` only for international, remote, hiking, unreliable-connectivity, or explicit print needs. Use large text and monochrome-safe design with critical route, multilingual addresses, bookings, transport/payment, emergency, and exit plan—not the whole book.

## Ongoing review

All ten sections were confirmed on 2026-08-13. Future changes should be incremental, based on real-trip evidence, and synchronised across the Chinese and English execution rules where behavior is shared.
