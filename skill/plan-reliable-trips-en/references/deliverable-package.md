# Formal Travel Package Delivery Rules

Read this module after the route has entered formal delivery, or when the user requests an offline mobile page, a formal handbook, a print version, image guidance, or a package that can be handed to an AI for questioning. Do not mechanically generate the whole package during early destination exploration or a simple comparison.

## 1. One authoritative content source, multiple usage views

- Treat the Markdown handbook as the editable, updateable authoritative content source; the offline mobile page and the print version are both derived from it, and facts are never maintained separately.
- The PDF is a portable conversion of the handbook (reading, searching, sharing): convert it from the handbook whenever needed and do not name or maintain it as a separate deliverable; convert only on demand.
- Every artifact uses the same trip name, date range, version, generation date, and latest verification date. When the route or dynamic facts change, regenerate the affected views in step.
- Do not copy the same paragraph into multiple chapters; use a contents list, internal links, tags, and clear cross-references.

## 2. Default formal package

A formal itinerary delivers two artifacts by default; everything else is appended on demand:

| Artifact | Use | Default requirement |
|---|---|---|
| `01_OFFLINE_MOBILE.html` | Primary on-site artifact: a single-file offline web page that opens directly in a phone browser | Data-driven, no network dependency; specification in section 5 |
| `02_TRAVEL-HANDBOOK.md` | Authoritative source file: continued editing, handoff to an AI for deeper questions, casual PDF conversion for sharing | Opens with a version and verification-date block; complete text, tables, and sources |
| `media/` | Actually embedded photo references, entrance/transfer locators, and essential diagrams | Exists only on demand and is not created without an image need; recognisable filenames with source and check date retained |

Generate the following only on demand; they are not a fixed burden for every trip:

- `03_PRINT-BACKUP.pdf`: the only paper deliverable, merging the former quick reference card and emergency print version into one (section 4). Generate it only when the user wants paper, needs a paper backup, or is heading to an area with unstable connectivity;
- separate booking or personal-document attachments: handle them only when the user actively supplies them and asks for organization; never write passport, full bank-card, or similar sensitive data into the guide by default.

When the host environment cannot generate HTML or PDF, state the limitation and deliver a usable alternative view; never claim an unverifiable file was generated.

A ZIP may accompany the delivery to preserve the whole set; when the user's environment supports folders, prefer the handbook plus `media/`, which is easier to keep editing and to hand to an AI.

## 3. Travel handbook information hierarchy

The handbook opens with a version block (replacing a separate instruction file): trip name, date range, version, generation date, latest verification date, current input and key assumptions, and the current status of every artifact.

Follow it with a clickable contents list in this lookup order:

1. one-page trip overview: dates, travelers, budget basis, accommodation bases, main transport, confirmed hard anchors, and highest-priority risks;
2. bookings and preparations to make now, plus the pre-departure recheck schedule;
3. overall route, accommodation, and city spatial relationships;
4. day-by-day route: a one-screen/page overview first, then node details;
5. only the topic cards relevant to this trip—accommodation, food, transport/payment, museums, photography, international operations, hiking, and the like;
6. bilingual place-name and key-phrase index;
7. key evidence, unresolved items, recheck points, and a summary of this plan's fact ledger (sources and check dates).

Use one consistent daily structure: `Day conclusion -> Timeline -> Place and entrance -> Transport/payment -> Food -> Photography -> Booking/risk -> Return and alternative`. Use a small set of fixed labels such as `[ENTRANCE] [BOOKING] [PAYMENT] [PHOTO] [RISK] [ALTERNATIVE]` to support full-text search, not opaque internal jargon.

## 4. Print version (on demand)

The print version is the only paper deliverable, merging the former quick reference card and print emergency version into one. It is not the handbook in a smaller font; it keeps only two kinds of information:

**Immediate on-site action**: the daily backbone timeline, hard reservations, recommended departure time, and latest return; copyable names/addresses for accommodation, stations, attraction entrances, meeting points, and pickup/drop-off; ticket access, transport mode, payment medium, and failure fallback; the main meal and a nearby backup.

**Emergency fallback**: flight/train numbers and terminals, each night's accommodation name, address, and phone; emergency contacts; payment backup (which card, how much cash); an exit plan for hiking or remote activities; and instructions that still work when the phone is dead, offline, or lost.

Prefer A4 layout, a larger font, and legibility in grayscale print, kept to a few pages; remove background introductions, sample photographs, and nonessential detail. A QR code may only supplement—important addresses and steps must also appear as text.

## 5. Offline mobile page specification

`01_OFFLINE_MOBILE.html` is the primary on-site artifact, generated from the repository template [assets/trip-mobile-template.html](../assets/trip-mobile-template.html): keep the template's page structure, styles, and script, and replace only the data and images—do not rewrite the page.

**Structure conventions**:

- All trip data lives in a standalone JSON block inside the page (`meta`: title, dates, route, version, and verification date; `days[]`: daily timeline, transport, lodging, restaurants, and notes; `pois[]`: attraction details and tips). The page script renders from the data; edit content only in the JSON, never in the page structure.
- The template's header comment documents each field's meaning and how to edit it. Images live in an image-map object at the top of the script, named by slot, and are not written into the JSON.
- Attractions that have not been researched carry a placeholder flag and render a placeholder panel—never invented content; researched attractions show the full introduction and that day's tips.

**Required capabilities**: single file, no network dependency, opens directly in a phone browser; tabs switch between overview / day-by-day itinerary / attractions / restaurants / reference pages; attractions in the daily timeline are clickable links to their detail views; a dark overlay keeps text readable over background images; body text remains findable through system search or in-page find.

**Build process**: use the confirmed handbook as the only source of truth and fill confirmed content into the template's JSON and image slots; after generation, open and accept the result in a real phone browser.

**Acceptance criteria**: opens in a real phone browser without errors; the number of days and attractions matches the handbook; every attraction link resolves; the version and latest verification date are written into the data block; total file size including images stays within 5MB.

## 6. Offline mobile page image specification

Images are collected in the image-map object at the top of the page script and named by slot (the cover is a single key, daily backgrounds are numbered by day); a missing slot falls back automatically to a theme-color gradient without breaking the page.

| Slot | Count | Selection logic |
|---|---|---|
| Cover image | 1 | The single most representative picture of this trip |
| Daily background | One per day, optional | 1) a real photo of the day's core attraction (image-text relevance first); 2) on a transit day or a day without a core attraction, a landmark of that day's city; 3) avoid similar shots of the same city on adjacent days |

**Source order**: user photos > CC-licensed reusable images (e.g. Wikimedia Commons) > official tourism board images for personal use. Never use reposted images of unknown origin.

**Technical specification**: JPEG, 800–1200px wide, at most 150KB per compressed image and 3MB across all images; choose medium-brightness frames and let the template's built-in overlay keep text readable; no animated images.

**Degradation discipline**: when no compliant, fitting image can be found, leave the slot empty—better no image than a wrong one, and a picture of the wrong city is worse than none. Attraction detail pages carry no image by default (to control file size and load speed); that is intentional, so do not add images merely to fill space.

## 7. Photography reference images and location images

Images in `media/` and the handbook solve only two problems that text handles poorly:

1. **Photography reference image**: for must-shoot points and ordinary attractions whose composition text cannot explain. Usually one to three images per key point, recording the source page, creator/organisation when available, verification date, the composition borrowed, position/direction, light, and whether an ordinary visitor can reproduce it; flag drone, long-lens compression, heavy editing, special season, or non-public positions.
2. **Entrance/transfer locator image**: for a hard-to-find entrance, the correct gate, platform, meeting point, pickup spot, parking entrance, museum branch, or trailhead. Prefer official maps or verifiable field images; add circles, arrows, and short labels to a screenshot when needed, together with a map link, a copyable name/address, a nearby landmark, and the exact sign to look for on site.

Every critical item must also carry adjacent text and alternative text. Date screenshots; mark entrances, construction, or signage that may change for pre-departure recheck. When an original image cannot be lawfully or reliably embedded, provide the source page and a simple self-made diagram; never use reposted images of unknown origin, and never put personal tickets, QR codes, or identity-document data into diagrams.

## 8. Bilingual names, signs, and field phrases

- Outside the user's home-language environment, give `planning-language name | local official name | official English name (if any)` in the detail card, plus a copyable map-search string and a local-script address.
- For a difficult entrance, reproduce the exact visible sign—exit number, gate name, floor, platform, or counter—not only a planning-language translation.
- Provide a small set of showable bilingual/local-language phrases for the current situations: confirming the driver's destination and total fare, rejecting extras, requesting an itemised charge, hotel check-in, dietary needs, and emergency help.
- Prefer official institutional spellings or a reliable language source. Mark complex phrases as machine-assisted when not independently checked; never replace local script with unreliable phonetic spelling.

## 9. Handing the package to an AI

The Markdown handbook is the best file for continued editing and AI context. Convert a PDF from the handbook when needed and keep text selectable, heading hierarchy clear, real tables rather than table images, images captioned, and links clickable; when the user's environment accepts only a single-file upload, either the PDF or the ZIP works as the carrier.

Add this short AI usage notice at the front of the handbook, after the version block:

> This is a travel-planning snapshot verified through **[date]**. Cite the section used in each answer. Opening, price, timetable, weather, visa, road, and trail status are dynamic and must not be treated as currently valid solely because they appear here; recheck online when relevant.

The user can ask directly: “When should I leave tomorrow?”, “List only the hotel address and the driver phrases”, “What should I cut or change if it rains today?”, or “What sign should I look for in this entrance image?” The AI should cite section/date and distinguish file facts, fresh online updates, and new planning judgment.

## 10. Build, update, and acceptance

Recommended lifecycle: `Route draft -> User confirmation -> Formal package (offline mobile page + handbook by default) -> T-7 update -> T-48 critical recheck -> In-trip adjustment`; generate the print version and the PDF only when the user needs them.

- Update the authoritative Markdown first, then rebuild the offline mobile page (and any print version already generated), and list the change in the handbook's version block;
- use the fact ledger as the recheck baseline: re-verify only entries that have expired or are marked `Recheck before departure`, not every fact; ledger rules are in `source-verification.md`;
- after generating or converting a PDF, render and inspect contents, page breaks, tables, all required fonts, image clarity, links, page numbers, and phone readability;
- check the offline mobile page on a real device against the acceptance criteria in section 5;
- check image sources and labels, bilingual names, entrance text, and version consistency;
- never make an external link the only carrier: addresses, times, price units, payment steps, and safety instructions that affect on-site action must stay in the body text;
- if a format cannot be generated or verified, say so; do not deliver a file that merely has the correct extension but cannot be relied on.
