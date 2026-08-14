# Formal Travel Package Delivery Rules

Use this module after the route has entered formal delivery or when the user requests a PDF, illustrated directions, quick-reference card, print fallback, offline use, or a package that can be handed to another AI. Do not mechanically generate the whole package during early destination exploration or a simple comparison.

## 1. One source of truth, multiple views

- Maintain the complete Markdown handbook as the editable and updateable authority. Derive the full PDF, quick reference, and print emergency version from it; do not maintain separate facts.
- Use the same trip name, date range, version, generation date, and latest verification date across files. When the route or dynamic facts change, rebuild affected views.
- Avoid duplicating the same paragraph across chapters. Use a clickable contents list, internal links, restrained tags, and clear cross-references.

## 2. Default formal package

Use language-appropriate filenames; the following English names are recommended for an English delivery:

| Artifact | Use | Default requirement |
|---|---|---|
| `00_START-HERE.md` | File purpose, version, latest verification, and update instructions | Short; do not repeat the guide |
| `01_TRIP-QUICK-REFERENCE.pdf` | Today's timeline, addresses, entrance, booking, payment, return, and emergency details | Phone-first; one screen/page group per day, not necessarily one page total |
| `02_COMPLETE-TRAVEL-HANDBOOK.md` | Authoritative source for editing, review, and AI follow-up | Complete text, tables, image references, and sources |
| `02_COMPLETE-TRAVEL-HANDBOOK.pdf` | Mobile search, offline reading, sharing, single-file AI upload, or ordinary printing | Text layer, bookmarks, internal links, captions; never a scan-only PDF |
| `media/` | Actually used photo references, entrances/transfers, and essential diagrams | Recognisable names, source and verification date retained |

Generate these only when useful:

- `03_PRINT-EMERGENCY.pdf`: international, remote, hiking, unreliable-connectivity, or explicit paper-backup trips;
- a single-file offline HTML: only when the user needs interactive phone search/folding and device usage is known;
- reservation or personal-document attachments: only when explicitly supplied and requested. Do not put passport, full bank-card, verification code, or other unnecessary secrets into the guide.

A ZIP may preserve the entire package. When another AI accepts only one file, prefer the complete searchable PDF; when it accepts Markdown plus a folder, prefer the source Markdown and `media/`.

## 3. Complete handbook hierarchy

Use clickable contents and PDF bookmarks in this lookup order:

1. cover, version, latest verification date, current input, and important assumptions;
2. one-page trip overview: dates, travelers, budget basis, accommodation bases, main transport, confirmed hard anchors, and highest risks;
3. actions to book/prepare now and the pre-departure recheck schedule;
4. overall route, accommodation, and city spatial relationship;
5. daily route: one-screen/page overview first, then node details;
6. only the relevant accommodation, food, transport/payment, museum, photography, international, hiking, and purchase cards;
7. multilingual place-name and essential-phrase index;
8. key evidence, unresolved items, and recheck points.

Use a consistent daily sequence: `Day conclusion -> Timeline -> Place and entrance -> Transport/payment -> Food -> Photography -> Booking/risk -> Return and alternative`. Use a small set of searchable labels such as `[ENTRANCE] [BOOKING] [PAYMENT] [PHOTO] [RISK] [ALTERNATIVE]`, not opaque internal jargon.

## 4. Quick reference and print emergency version

The quick reference is not the full handbook in smaller type. Keep only information needed for immediate action:

- daily timeline, hard reservations, recommended departure, and latest return;
- copyable names/addresses for accommodation, station, attraction entrance, meeting point, pickup and drop-off;
- ticket access, transport, payment medium, price reference, and failure fallback;
- primary meal and nearby backup, key photo window, and one composition cue;
- day's risk, weather trigger, emergency contact, and necessary local phrase.

The print emergency version should be A4-friendly, large enough, and readable in grayscale. Remove nonessential sample photographs and background history; keep flights/trains, accommodation address, critical bookings, payment backup, emergency help, hiking exits, and offline execution. A QR code may supplement but never replace written addresses and steps.

## 5. Photography and location images

Images should solve two problems that text handles poorly:

1. **Photo reference**: for must-shoot points and ordinary attractions whose composition needs a visual. Usually one to three images, with source page, creator/organisation when available, verification date, lesson, position/direction, light, and reproducibility. Flag drone, long-lens compression, heavy editing, rare season, or non-public position.
2. **Entrance/transfer locator**: for difficult entrance, correct gate, platform, meeting point, pickup, parking entrance, museum branch, or trailhead. Prefer official maps or verifiable field images. Add circles/arrows/short labels when needed, plus map link, copyable name/address, nearby landmark, and the exact sign to find.

Every critical image also needs adjacent text and alternative text. Date screenshots and mark construction, entrance, or signage for pre-departure recheck. When an original image cannot be lawfully or reliably embedded, link the source and create a simple original diagram. Never put personal ticket QR codes or identity/payment documents into locator examples.

## 6. Multilingual names, signs, and field phrases

- Outside the user's home-language environment, give `planning-language name | local official name | official English name (if any)` and a copyable map-search string/local-script address.
- For difficult entry, reproduce the exact visible sign: exit number, gate name, floor, platform, counter, or building—not only a translation.
- Provide a small set of showable bilingual/local-language phrases for the current situations: confirm driver destination and total, reject extras, ask for an itemised charge, hotel check-in, dietary needs, and emergency help.
- Prefer official spellings or a reliable language source. Mark complex phrases as machine-assisted when not independently checked; do not replace local script with unreliable phonetic spelling.

## 7. Handing the package to an AI

Markdown is best for editing and continued AI context. The complete PDF must have selectable text, clear heading hierarchy, real tables rather than table screenshots, captions, and clickable links so a single uploaded PDF remains understandable.

Put this short notice near the handbook front, translated to the delivery language when needed:

> This is a travel-planning snapshot verified through **[date]**. Cite the section used in each answer. Opening, price, timetable, weather, visa, road, and trail status are dynamic and must not be treated as currently valid solely because they appear here; recheck online when relevant.

Users should be able to ask: “When should I leave tomorrow?”, “List only the hotel address and driver phrases”, “What should I cut if it rains today?”, or “What sign should I find in this entrance image?” The AI should cite section/date and distinguish file fact, fresh online update, and new planning judgment.

## 8. Build, update, and acceptance

Recommended lifecycle: `Route draft -> User confirmation -> Formal package -> T-7 update -> T-48 critical recheck -> In-trip adjustment`.

- Update the authoritative Markdown first, rebuild the PDF/quick reference, and list the change in the delivery note.
- After PDF creation, render and inspect contents, page breaks, tables, all required fonts, image clarity, links, page numbers, and phone readability.
- Check image sources/labels, multilingual names, entrance text, and version consistency.
- Never make an external link the only carrier of an actionable address, time, price unit, payment step, or safety instruction.
- If a format cannot be generated or visually verified, say so. Do not deliver a file that merely has the correct extension.
