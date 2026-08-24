# Contributing to AI Travel Planning Kit

[中文版](CONTRIBUTING.md)

Thank you for helping **AI Travel Planning Kit（AI 旅行规划工具包）** become more reliable, simpler, and more useful on real trips.

## High-value contributions

- reproducible failures from real travel;
- country- or region-specific methods for verifying payments, transport, taxes, language, or safety;
- better official, professional, or local source hierarchies;
- field-tested improvements to accommodation, dining, air travel and airfare, self-drive, travel-health, insurance, museum, photography, or hiking rules;
- removal of duplicated, rigid, unclear, or decision-irrelevant constraints;
- clearer trip briefs, delivery structures, and AI collaboration workflows;
- fixes for broken links, inconsistent terminology, translation drift, or incorrect module routing.

## Classify the rule before proposing it

State whether your proposal is a:

- safety or legal boundary;
- stable hard constraint;
- default preference;
- soft preference;
- per-trip parameter;
- dynamic fact that applies only to a destination.

Do not turn one travel experience into a universal rule. Describe where the proposed behavior applies and where it does not.

## A useful issue includes

1. what happened;
2. why the current rules handled it poorly;
3. a reproducible travel scenario;
4. the desired behavior, not merely a request for more text;
5. direct sources that support the conclusion;
6. publication or verification dates for dynamic facts;
7. whether safety, law, or expensive non-refundable decisions are involved.

Never submit passport or identity data, payment information, booking QR codes, account credentials, phone numbers, private addresses, or an unredacted personal itinerary.

## Pull requests

Keep one pull request focused on one topic where practical. Its description should explain:

- what changed;
- why it changed;
- the effect on users and agent behavior;
- which files changed;
- how the change was validated;
- what limitations remain.

When changing detailed rules, also inspect:

- whether the conditional loading matrix in `SKILL.md` still finds the rule;
- whether the rule has one responsible specialist file and avoids an implicit traveler profile or duplicate behavior;
- whether specialist checks stay in their owner module; `output-contract.md` keeps only cross-task minimum checks and does not duplicate specialist lists;
- whether `trip-brief-template.md` genuinely needs another field;
- whether `docs/architecture.md` and its English counterpart need a loading update; add historical discussion to `constraint-review` only when it has durable value;
- whether a new/removed reference is present in the right scenario packs and full archive in `scripts/build-release-assets.sh`;
- whether both editions preserve the same safety and decision logic while the Chinese edition remains China-origin and the English edition remains origin-neutral; literal translation is not required.

Whenever the same information lives in several files (module inventories, deliverable names, counts, terminology), run the full sweep described in the next section, "Consistency sweep".

## Consistency sweep: change one place, check every place

This repository intentionally repeats certain information: module inventories, deliverable names, module counts, triggers, and cross-module handoffs appear across skill files, build scripts, docs, examples, and tests. That keeps each file independently readable; the cost is that every change must be synchronized. **Divergent versions across files are not acceptable**: any mismatch in content, structure, cross-references, or counts means the change is incomplete.

**Before changing**: search the whole repository for every place the information appears. Search both editions together, and watch for case, hyphen, and underscore variants.

**Sync map** (what changes → what must be checked):

| Object | Places that must stay in sync |
|---|---|
| Add / remove / rename a references module | routing tables in both `SKILL.md` files; boundary/handoff sentences in other modules that mention it; scenario-pack lists in `scripts/build-release-assets.sh`; `docs/architecture.md`; the file map in section 8 of `docs/ai-review-guide.md`; README capability lists (both editions); every hard-coded module count (README, docs, repository About); `tests/routing-cases.tsv` |
| Trigger changes | the routing row in `SKILL.md` and the trigger statement at the top of the module file must match; behavioral expectations in `tests/routing-cases.tsv` |
| Deliverable names / structure | `references/deliverable-package.md` (both editions); README deliverables tables (both); the formal-delivery section of `docs/usage-guide.md` (both); `examples/prompts.md` (both); deliverable-exception defaults in `assets/trip-brief-template.md` (both) |
| Moving a rule between modules | remove from the source module, add to the destination, update `SKILL.md` routing and handoff sentences elsewhere, in both editions—anything less is rolled back |
| Counts and hard-coded numbers | grep the number repo-wide and update each occurrence, or reword to avoid the fixed count; the repository About description is not in git and is updated separately at release time |
| Terminology / file renames | grep old terms and their variants repo-wide; only `constraint-review` history may keep old names |

**After changing** (mandatory before commit):

1. Re-search the repository with the old names, counts, and terms: zero hits outside `constraint-review` history, in both editions;
2. Land both language editions in the same commit; changing one side alone is an incomplete change;
3. Run `scripts/validate-project.sh`;
4. Append a dated record to `docs/constraint-review.md` and `docs/constraint-review.en.md` stating what changed and which locations were synchronized;
5. Describe the sweep result in the pull request (search scope + validation output), not just the change itself.

## Writing principles

- Use clear, actionable Chinese or English.
- State the behavior and applicability before its rationale.
- Do not replace concrete judgment with abstract terminology.
- Do not treat popularity, ratings, or one platform's ranking as fact.
- Never invent URLs, fares, coordinates, schedules, or official advice.
- Preserve source conflicts.
- Keep soft preferences soft.
- Prefer simplification; do not measure quality by rule or file count.
- Translate meaning and decision behavior, not word order.

## Validation

Before submission:

- check Markdown links;
- search for stale terminology and conflicting rules;
- confirm there are no local absolute paths or sensitive data;
- run `scripts/validate-project.sh` to check both Skills, links, portable profiles, and routing cases;
- rebuild both language release assets when references or routing change;
- update `tests/routing-cases.tsv` after trigger/routing changes and run at least one narrow real prompt to observe module overloading;
- review the complete diff and confirm it contains only the intended topic.

## License

By contributing, you agree that your contribution is licensed under this repository's [MIT License](LICENSE).
