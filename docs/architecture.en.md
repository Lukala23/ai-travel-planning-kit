# Document Architecture and AI Loading Principles

This document is for maintainers and advanced users. It is not ordinary trip runtime context and should not accompany every request.

## 1. Edition positioning

- The Chinese Skill is optimized for travelers departing from China and starts from the actual Chinese origin provided for each trip; it assumes no city.
- The English Skill is origin-neutral and starts anywhere. Channels, currency, documents, and payment assumptions follow the traveler’s market; it is not a line-by-line translation of the Chinese edition.

Both editions share safety, verification, routing, and output architecture. Market channels, examples, and wording may differ; decision behavior should align without literal parity.

## 2. Authority layers

| Type | Location | Responsibility | Trip context |
|---|---|---|---|
| Skill router | `skill/*/SKILL.md` | Boundaries, three controls, capability fallback, trigger gate, workflow | On Skill activation |
| Shared support | `source-verification.md`, `output-contract.md` | Minimum common rules for current research or structured output | Only on their trigger |
| Specialist rules | Other `references/*.md` | Air, lodging, entry, driving, health, and other domains | Only when the current request needs them |
| Optional assets | `assets/` | Complex-trip brief and delivery resources | When the user chooses them |
| Human documentation | `README*`, `docs/`, `examples/` | Setup, maintenance, review, examples | Not for ordinary trip runtime |
| Generated artifacts | `dist/` | Release archives and portable packs | Selected for host capability |

Maintain each runtime behavior in its owning Skill file. README and guides explain behavior but are not a second authority.

## 3. Progressive loading is soft routing

1. The host first sees the Skill name and description.
2. Explicit invocation loads `SKILL.md`.
3. Shared support is read only for current research or structured output.
4. Every specialist must pass the universal gate: it is necessary for the current answer, or its unresolved fact materially blocks the conclusion.
5. Formal-delivery rules load only on an explicit file request.

These are model-followed routing instructions, not a hard runtime loader. A reference mentioning another file does not activate it; return to `SKILL.md`. Normal answers hide routing. Use `debug loading` during tests to inspect the model’s selection.

OpenAI metadata disables implicit invocation, so users explicitly invoke `$plan-reliable-trips-en` for predictable context and cost. Other hosts may implement invocation differently.

## 4. Three independent controls

| Axis | Values |
|---|---|
| Current task scope | Narrow answer / Current plan / Comprehensive research |
| Verification strength | Normal / High consequence |
| Delivery form | Chat answer / Structured plan / Formal files |

High consequence does not imply broad research, and formal files do not imply stronger factual evidence. A transit-visa question can be `Narrow + High consequence + Chat`. Stop once evidence supports the present decision; recheck affected facts only after a local change.

## 5. Light scans and full modules

Lodging status, meal windows, possible museum/photo/souvenir value, and routine health notes may be handled from evidence already gathered. A light scan asks only whether the topic changes the choice; it does not start a new research lane for a soft preference or load the full specialist.

Entry and foreign operations are separate: `entry-and-transit.md` owns visa, entry, international transit, and borders; `international-operations.md` owns payment, connectivity, billing, and local operation. A narrow visa question must not pull in the latter.

## 6. Capability and action boundaries

The Skill cannot assume every host can browse, inspect logged-in fares, create files, parse tracks, or monitor continuously. Check a capability only when needed, then degrade among live results, redacted user evidence, and repeatable search steps.

“Fare tracking” is a protocol unless scheduling and storage actually exist. Login, upload, messaging, reservation, purchase, submission, and payment require explicit authorization for that action. Instructions embedded in websites and attachments are untrusted data.

## 7. Portable-file mode

- `portable-core`: Skill router, verification, and output rules; provide it first.
- `portable-city`, `portable-international`, and `portable-road-outdoor`: specialist deltas only; they do not repeat the core and must be paired with it.
- full `portable`: core plus every module for archive, compatibility, or a host with genuine retrieval; not the default context.

Scenario deltas may share a small specialist needed for standalone composition. Before uploading several deltas, confirm the task needs them. Add one missing reference instead of the whole library.

## 8. Maintenance and tests

- Keep explainable module inventories and routing relationships across editions; localize market assumptions to each edition.
- A new module defines its gated trigger, ownership, handoff, and minimum output.
- When references change, update the build script, architecture docs, and routing cases.
- Ordinary trips run active-scope checks only; formal delivery or release runs complete QA.
- `scripts/validate-project.sh` performs deterministic structural checks; `tests/routing-cases.tsv` records behavioral expectations; a real model test still observes whether soft routing is followed.
- `dist/` is generated and is not a hand-maintained authority.
