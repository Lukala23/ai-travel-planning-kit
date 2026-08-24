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
mkdir -p ~/.agents/skills
ln -s "$PWD/skill/plan-reliable-trips-en" ~/.agents/skills/plan-reliable-trips-en
```

Do not overwrite an existing destination without comparing or backing it up.

```text
Use $plan-reliable-trips-en for the trip below.
Extract only the conditions needed for the current question. Ask only when an
ambiguity would change the route or safety.
```

### File-upload mode

An AI with files or workspace context can use the rules without a native Skill. Upload `ai-travel-planning-kit-portable-core.en.md` first, then add the closest scenario delta. A delta does not repeat or replace the core:

| Scenario pack | Scope |
|---|---|
| `portable-city.en.md` | Destination candidates, daily route, lodging/dining decisions, and public transport |
| `portable-international.en.md` | Air chain, entry/transit, triggered health, and minimum insurance reminders |
| `portable-road-outdoor.en.md` | Self-drive, hiking, health, and related insurance reminders |

If a needed specialist is absent, add its individual `references/*.md` from the Skill archive. Add photography, museums, or souvenirs only when the user explicitly values them, they enter the main route, or the purchase is real. The full `ai-travel-planning-kit-portable.en.md` is for archive, compatibility, or a platform that genuinely searches the whole library—not the default upload.

Natural language is normally sufficient. Add the advanced trip form only when the user completed it or the trip has unusually many conditions.

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

- flight-date flexibility, cabin/baggage, connection and red-eye tolerance, self-transfer, willingness to position from the actual origin through another gateway, airfare/refund needs, and existing fare alerts;
- driving documents, traffic side, vehicle, protection/excess, fuel/charging, toll, parking, and border needs;
- non-hiking altitude, medicine/device, chronic condition/pregnancy, vaccine, or medical access;
- existing travel cover, non-refundable exposure, special activity, and card-benefit activation;
- hiking ability, altitude experience, and track source;
- interpretation or guide budget;
- willingness to invest extra time in photography;
- gift recipients and souvenir budget;
- accessibility, children, diet, medical needs, or special activities.

Write `Unknown` when something is not decided. See the [English trip brief](../skill/plan-reliable-trips-en/assets/trip-brief-template.md).

## 3. Set task scope, verification strength, and delivery form separately

Do not bind “how broad,” “how strongly verified,” and “whether files are created” into one level. Let the AI select independently:

- current scope: Narrow answer / Current plan / Comprehensive research;
- verification: Normal / High consequence;
- delivery: Chat / Structured plan / Formal files.

A visa or transit issue can be `Narrow + High consequence + Chat` without researching lodging, payment, and the whole itinerary.

### Stage A: extract necessary conditions

An ordinary question does not require a complete brief. For a complex or ambiguous task, summarize only parameters that affect the decision:

```text
Do not expand into a complete route yet. Extract only the known facts, hard
constraints, unknowns, and temporary assumptions needed for this decision.
Do not print fields from unrelated specialist modules.
Ask only about gaps that change safety, feasibility, accommodation area,
transport structure, or total budget.
```

Check that the AI has not inherited travelers, budget, dates, equipment, or interests from another trip. The optional advanced brief remains available for genuinely complex work.

### Stage B: minimum trip-condition check

For an executable itinerary or go/no-go judgment, ask the AI to state what must minimally be true: entry/permit requirements for the travel document, long-distance access from the actual origin to the first node and back from the final node, major unavoidable budget costs, and the user's own conditions. For an unbooked flight, this gate only confirms sellable routing and broad complete cost; the air module performs the deeper comparison next. Mark each `Met / To confirm / Not met`, then give `Feasible / Conditionally feasible / Material mismatch / Cannot yet assess`. Even when no obvious blocker is found, preserve every condition still to satisfy or recheck. Skip this process for inspiration-only exploration.

### Stage C: candidates and structure

Ask the AI to establish:

- the destination's genuinely core experiences;
- which famous places have value and which mainly have marketing reach;
- how accommodation areas affect daily transport, evening walking, and food;
- structural constraints from transport, payment, booking, visas, season, and weather;
- expensive or risky decisions that require confirmation first.

The goal is to choose, not to force every candidate into the itinerary.

### Stage D: route draft

A route should include:

- each day's start and finish;
- door-to-door movement, queues, and buffers;
- normal meals and rest;
- latest safe arrival for important bookings;
- return to accommodation or the next transport node;
- executable cuts or swaps for weather, closure, or delay;
- clear units and required versus optional costs.

### Stage E: specialist verification

Check only what this trip needs:

- a complete return/open-jaw chain from the actual origin: airline-direct inventory and rules plus reputable local/regional channels the traveler can buy from; like-for-like baggage, currency, positioning transport/lodging, and connection responsibility; when dynamic fares are inaccessible, use repeatable search steps or redacted user quotes; give a booking or tracking protocol with triggers and a latest decision date;
- accommodation total price, taxes, cancellation, and exact room type;
- whether public transport really accepts the user's existing phone, wallet, or cards;
- normal taxi, charter, and unusual-transport prices plus written confirmation language;
- local SIM/eSIM, roaming, and offline fallback;
- self-drive contract, CDW/LDW and excess, fuel/charging, toll tag, winter equipment, border use, assistance, penalties, and pickup/return evidence;
- only necessary insurance reminders: mandatory evidence, special activity/altitude, remote evacuation, or planned reliance on card coverage; the traveler handles whole-trip insurance and full policy wording;
- vaccine/prophylaxis, medicine import, non-hiking altitude, food/vector, care, and evacuation when the health module triggers;
- statutory tax, service charge, tip, deposit, and reported unofficial demands;
- what is actually on display in museums, language access, and guide value;
- reference photographs, shooting position, and reproducibility;
- hiking track integrity, permits, exits, rescue, insurance, and medical access.

### Stage F: formal delivery

After the route and key choices are confirmed:

```text
The route is confirmed. Generate the formal travel package.
Use one Markdown source of truth for the offline mobile page, complete PDF, quick card, and required images.
Put the version, generation date, latest verification date, and recheck points in every file.
```

In the formal package, `01_OFFLINE_MOBILE.html` is the primary on-site deliverable: a single offline web page saved to the phone before departure and opened directly in the phone browser without a network. Tabs switch between the overview, day-by-day itinerary, and place views; places in each day's timeline link to their details, and the text is searchable. `01_TRIP-QUICK-REFERENCE.pdf` is its print counterpart, generated on demand for paper backups or no-browser situations rather than as a fixed burden of every delivery.

## 4. Judge source reliability

| Source | Good for | Cannot prove alone |
|---|---|---|
| Government / competent authority | Law, visa, permit, safety, official fee | Subjective experience |
| Attraction / operator | Opening, tickets, services, entrance, policy | “Most worthwhile” |
| China-market flight platforms + airline direct | Current China-market route/fare plus inventory, baggage, fare rules, and connection responsibility | Guaranteed future movement or inventory after an alert |
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

Place citations beside conclusions and include the verification date. Safety, law, and expensive non-refundable decisions require at least one responsible authority or direct operator; add a second independent source when wording is ambiguous, evidence conflicts or is inaccessible, or the downside is severe and confirmation is practical.

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

- Lead on site with `01_OFFLINE_MOBILE.html`: open it in the phone browser, move between days with tabs, tap a place in the timeline for its details, and search the text directly.
- Use the quick-reference PDF (the print counterpart of the offline page) when a paper backup or a no-browser situation requires it.
- Search the complete PDF by local name or tags such as `[Entrance]`, `[Payment]`, `[Risk]`, and `[Photo]` for full background, images, and fallback detail.
- When giving the PDF to an AI, require the section and document verification date used.
- For live changes, require current online verification rather than relying only on the old package.
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

Do not change the whole toolkit because of a casual preference expressed in one trip. Use the [AI review guide](ai-review-guide.en.md) to classify it as a safety boundary, current hard constraint, overridable default, soft preference, or per-trip parameter. Keep personal conditions and current preferences in the trip brief. Change the responsible specialist file only when intentionally changing toolkit behavior, record the impact, and do not create a separate long-term preference index.
