# Contributing to AI Travel Planning Kit

[中文版](CONTRIBUTING.md)

Thank you for helping **AI Travel Planning Kit（AI 旅行规划工具包）** become more reliable, simpler, and more useful on real trips.

## High-value contributions

- reproducible failures from real travel;
- country- or region-specific methods for verifying payments, transport, taxes, language, or safety;
- better official, professional, or local source hierarchies;
- field-tested improvements to accommodation, dining, museum, photography, or hiking rules;
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
- whether `planning-principles.md` conflicts with it;
- whether `output-contract.md` needs a corresponding quality check;
- whether `trip-brief-template.md` genuinely needs another field;
- whether `docs/constraint-review.md` and its English counterpart need a design note;
- whether the Chinese and English versions still express the same decision behavior.

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
- validate both Agent Skill directories when either shared rule set changes;
- review the complete diff and confirm it contains only the intended topic.

## License

By contributing, you agree that your contribution is licensed under this repository's [MIT License](LICENSE).
