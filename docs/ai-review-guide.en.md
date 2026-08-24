# Review and edit travel preferences with AI

[中文版](ai-review-guide.md)

**AI Travel Planning Kit** lets you review rules and overridable preferences one module at a time. The goal is not to accumulate rules. The goal is to make human–AI decisions reviewable, editable, and reversible without turning one trip's personal conditions into global behavior.

## 1. Classify a request before editing

The same natural-language comment can be misread as very different rules. Classify it first:

| Level | Meaning | Example | May a trip override it? |
|---|---|---|---|
| Safety / legal boundary | Do not proceed if it fails | Do not enter a closed trail; do not advise paying a public official | No |
| Current hard constraint | This trip cannot violate it | Step-free access is required; the traveler cannot drive this trip | No; provide it again next trip |
| Overridable default | A module applies it when the trip says nothing else | Use a normal, balanced sightseeing pace | Yes |
| Soft preference | A ranking bonus, not a gate | Prefer interesting, portable, locally distinctive gifts | Yes; it must not block the plan |
| Per-trip parameter | Belongs only to this trip | Travelers, budget, destination, whether it is a holiday | Collect again next trip |

The most common error is expanding “I may prefer…” into a global hard standard. Ask whether the comment would truly rule out every other option. Keep personal conditions and one-trip tendencies in the trip brief; change a specialist module only when the user intends to change toolkit behavior.

## 2. Review one topic at a time

Do not ask the AI to rewrite every file at once. Use this sequence:

1. choose one topic, such as accommodation, payments, museums, or hiking;
2. ask the AI to summarize current behavior without editing;
3. identify where it misrepresents the real intent;
4. ask for two to five simplified rules;
5. confirm them individually;
6. update the relevant execution file, design review, and only necessary trip-brief fields;
7. search for stale wording elsewhere;
8. validate the Skill structure;
9. commit the change with Git.

## 3. Review prompt

```text
Review only the rules about [topic].

Do not edit anything yet. First explain:
1. what the current rules make the agent do in practice;
2. which items are safety boundaries, stable hard constraints, defaults,
   soft preferences, or per-trip parameters;
3. whether a casual preference has been made too detailed or too rigid;
4. whether rule complexity is harming real travel decisions.

Then propose concise, actionable revisions and wait for my confirmation.
```

After confirmation:

```text
Apply the rules we just confirmed.

Update:
1. the authoritative execution rules;
2. the design-review record;
3. the trip brief only when the item truly is per-trip input.

List changed files, the behavioral change, remaining uncertainty, and any stale
wording you checked for after editing.
```

## 4. Require an impact statement

Every modification should explain:

- which file is authoritative;
- which tasks load the rule;
- whether it changes candidate screening, routing, cost, risk, or delivery;
- whether it creates a new required input;
- whether it conflicts with safety, law, or another confirmed rule;
- whether it is a copy change or a decision-behavior change.

If the AI cannot explain the impact, do not accept the edit immediately.

## 5. Resist unnecessary required fields

A trip-brief field is worth asking only when the answer materially changes:

- safety or legality;
- route feasibility;
- accommodation area or transport structure;
- total budget or an irreversible booking;
- whether a traveler can participate;
- a user-defined core experience.

Everything else can be extracted from natural language, left unknown, represented as an explicit temporary assumption, or asked only when the relevant module loads.

## 6. Preserve the right amount of freedom

Good travel constraints are usually decision standards, not fixed answers.

Better:

> Avoid accommodation changes that add no experiential value. Change properties when a scenic hotel, mountain hut, historic building, or other stay offers enough unique value, and explain moving cost and weather-failure risk.

Worse:

> A trip may change hotels only once.

Better:

> Handmade, uncommon, and difficult-to-replicate qualities improve a souvenir's ranking; they are not mandatory gates.

Worse:

> Buy only fully handmade souvenirs made without machinery.

## 7. Separate facts from preferences

These are facts, not preferences, and cannot be overridden by “I want it this way”:

- visas, permits, law, and official charges;
- current opening, closure, and operating status;
- weather warnings and road or trail hazards;
- cards, wallets, and devices a payment system actually supports;
- insurance coverage and rescue conditions;
- facts neither the user nor the model can verify.

Preferences choose among options that are already legal and feasible.

## 8. File ownership

| Topic | Primary file |
|---|---|
| Global operating boundaries and module routing | `SKILL.md`; keep only per-trip isolation, workflow, priority, and loading rules, with no permanent personal preference index |
| Shared dynamic-fact and source floors | `references/source-verification.md`; keep specialist source rules in the active domain module |
| Routes and fallbacks | `references/route-core.md` |
| Accommodation | `references/accommodation.md` |
| Dining | `references/dining.md` |
| Air routing, flight search, fare tracking, and booking timing | `references/air-travel.md` |
| Public-transport payment | `references/public-transit.md` |
| Taxis, charters, and scam prevention | `references/taxi-charter.md` |
| Self-drive and rental car | `references/self-drive.md` |
| Visa, entry, international transit, and borders | `references/entry-and-transit.md` |
| International payment, connectivity, charges, and local operation | `references/international-operations.md` |
| Health and medical | `references/health-and-medical.md` |
| Travel insurance | `references/travel-insurance.md` |
| Photography | `references/photography.md` |
| Museums | `references/museum-visits.md` |
| Hiking and track review | `references/hiking-rules.md` |
| Formal travel package | `references/deliverable-package.md` |
| Optional complex-trip input form | `assets/trip-brief-template.md`; ordinary work uses natural language |
| Minimum cross-task output | `references/output-contract.md` |
| Formal files and complete acceptance | `references/deliverable-package.md` |
| Loading and document ownership | `docs/architecture.en.md` |

`SKILL.md` owns task scope, verification strength, delivery form, the universal trigger gate, workflow, and routing. Keep detailed research, source, and delivery rules in the responsible reference. One reference mentioning another does not automatically load it.

## 9. Acceptance checklist

- [ ] Personal conditions and per-trip information remain in the trip brief.
- [ ] A soft preference has not become a rejection criterion.
- [ ] No unnecessary required field was added.
- [ ] Users can understand headings and status labels.
- [ ] The same fact is not contradicted across files.
- [ ] Every related location is synchronized: stale names, counts, and terms return zero hits across both editions (history records aside), and both editions changed in the same commit.
- [ ] Every universal specialist rule has one authoritative file, with no separate long-term preference index or duplicate body.
- [ ] The loading matrix can find the new rule.
- [ ] Safety and legal priority remain intact.
- [ ] Dynamic facts still require current verification.
- [ ] The design review and execution rules agree.
- [ ] Chinese and English versions preserve safety and decision behavior while keeping their intended market positioning.
- [ ] Both Skills validate.

## 10. Common anti-patterns

### Treating a user's exact words as a complete specification

“I like more local things” does not require a material, machinery, and supply-chain audit.

### Fixing one universal planning sequence

Destination exploration, accommodation, routing, hiking, and updates can combine in parallel. Every trip need not follow a rigid attractions → hotel → transport → food waterfall.

### Replacing judgment with more fields

A longer form is not necessarily better. Replace vague mandatory labels such as relaxed / balanced / intense with actual start and finish times, walking and standing load, fixed bookings, and priority cuts.

### Hiding uncertainty in fluent prose

Use `Uncertain` or `Recheck before departure` when evidence is missing. Do not invent a plausible fare, entrance, or schedule.

### Printing every module in every guide

Conditional rules exist to load only what matters. Do not add a hiking chapter to a city trip or manufacture a photography mission when no location justifies one.

## 11. Keep changes reversible with Git

Prefer one focused commit per topic, for example:

```text
clarify accommodation trade-offs
add taxi fare and scam checks
simplify souvenir preferences
define track review workflow
```

Before committing, read the diff and remove local paths, bookings, contact details, identity documents, and other private information. A major change should explain what changed, why, its effect on users and output, how it was validated, and what boundaries remain unresolved.
