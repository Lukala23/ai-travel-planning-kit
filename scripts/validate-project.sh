#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd "$script_dir/.." && pwd)"
tmp_dir="$(mktemp -d)"

cleanup() {
  rm -rf "$tmp_dir"
}
trap cleanup EXIT

fail() {
  printf 'ERROR: %s\n' "$1" >&2
  exit 1
}

search_recursive() {
  local pattern="$1"
  shift

  if command -v rg >/dev/null 2>&1; then
    rg -n "$pattern" "$@"
  else
    grep -R -n -E -- "$pattern" "$@"
  fi
}

search_quiet() {
  local pattern="$1"
  shift

  if command -v rg >/dev/null 2>&1; then
    rg -q "$pattern" "$@"
  else
    grep -q -E -- "$pattern" "$@"
  fi
}

for skill_name in plan-reliable-trips plan-reliable-trips-en; do
  skill_dir="$repo_root/skill/$skill_name"
  [[ -f "$skill_dir/SKILL.md" ]] || fail "missing $skill_dir/SKILL.md"
  [[ -f "$skill_dir/agents/openai.yaml" ]] || fail "missing $skill_dir/agents/openai.yaml"
  grep -q '^name: ' "$skill_dir/SKILL.md" || fail "missing name frontmatter in $skill_name"
  grep -q '^description: ' "$skill_dir/SKILL.md" || fail "missing description frontmatter in $skill_name"
  grep -q 'allow_implicit_invocation: false' "$skill_dir/agents/openai.yaml" || fail "implicit invocation is not disabled in $skill_name"
done

find "$repo_root/skill/plan-reliable-trips/references" -maxdepth 1 -type f -name '*.md' -exec basename {} \; | sort > "$tmp_dir/zh-references.txt"
find "$repo_root/skill/plan-reliable-trips-en/references" -maxdepth 1 -type f -name '*.md' -exec basename {} \; | sort > "$tmp_dir/en-references.txt"
if ! diff -u "$tmp_dir/zh-references.txt" "$tmp_dir/en-references.txt"; then
  fail "Chinese and English reference inventories differ"
fi

if search_recursive '昆明|Kunming|KMG' \
  "$repo_root/skill" "$repo_root/docs" "$repo_root/examples" \
  "$repo_root/README.md" "$repo_root/README.en.md" \
  "$repo_root/CONTRIBUTING.md" "$repo_root/CONTRIBUTING.en.md"; then
  fail "city-specific origin default remains"
fi

if search_recursive 'references/international-travel\.md' \
  "$repo_root/skill" "$repo_root/scripts/build-release-assets.sh" "$repo_root/README.md" "$repo_root/README.en.md" \
  "$repo_root/docs/architecture.md" "$repo_root/docs/architecture.en.md" \
  "$repo_root/docs/usage-guide.md" "$repo_root/docs/usage-guide.en.md" \
  "$repo_root/docs/ai-review-guide.md" "$repo_root/docs/ai-review-guide.en.md"; then
  fail "active documentation still links to removed international-travel.md"
fi

python3 - "$repo_root" <<'PY'
import csv
import re
import sys
from pathlib import Path

root = Path(sys.argv[1])

link_pattern = re.compile(r"(?<!!)\[[^\]]+\]\(([^)]+)\)")
for path in root.rglob("*.md"):
    if "dist" in path.parts:
        continue
    text = path.read_text(encoding="utf-8")
    for target in link_pattern.findall(text):
        target = target.strip().split("#", 1)[0]
        if not target or "://" in target or target.startswith(("mailto:", "#")):
            continue
        target = target.strip("<>")
        if not (path.parent / target).resolve().exists():
            raise SystemExit(f"broken local link: {path.relative_to(root)} -> {target}")

inventories = {}
for edition, folder in (("zh", "plan-reliable-trips"), ("en", "plan-reliable-trips-en")):
    inventories[edition] = {p.name for p in (root / "skill" / folder / "references").glob("*.md")}

cases_path = root / "tests" / "routing-cases.tsv"
with cases_path.open(encoding="utf-8", newline="") as handle:
    rows = list(csv.DictReader(handle, delimiter="\t"))
if not rows:
    raise SystemExit("routing-cases.tsv contains no cases")

seen = set()
for row in rows:
    case_id = row["id"].strip()
    edition = row["edition"].strip()
    if not case_id or case_id in seen:
        raise SystemExit(f"missing or duplicate routing case id: {case_id!r}")
    seen.add(case_id)
    if edition not in inventories:
        raise SystemExit(f"invalid edition in {case_id}: {edition!r}")
    include = {x.strip() for x in row["include_modules"].split(",") if x.strip()}
    exclude = {x.strip() for x in row["exclude_modules"].split(",") if x.strip()}
    if include & exclude:
        raise SystemExit(f"routing case {case_id} includes and excludes {sorted(include & exclude)}")
    unknown = (include | exclude) - inventories[edition]
    if unknown:
        raise SystemExit(f"routing case {case_id} names unknown modules: {sorted(unknown)}")

print(f"Validated {len(rows)} routing cases and local Markdown links.")
PY

"$repo_root/scripts/build-release-assets.sh" "$tmp_dir/dist"

for delta in \
  ai-travel-planning-kit-portable-city.md \
  ai-travel-planning-kit-portable-international.md \
  ai-travel-planning-kit-portable-road-outdoor.md \
  ai-travel-planning-kit-portable-city.en.md \
  ai-travel-planning-kit-portable-international.en.md \
  ai-travel-planning-kit-portable-road-outdoor.en.md; do
  if search_quiet 'Source file: .*SKILL\.md|源文件：.*SKILL\.md|references/source-verification\.md|references/output-contract\.md' "$tmp_dir/dist/$delta"; then
    fail "$delta repeats portable core"
  fi
done

search_quiet 'references/entry-and-transit\.md' "$tmp_dir/dist/ai-travel-planning-kit-portable-international.md" || fail "Chinese international delta misses entry module"
search_quiet 'references/international-operations\.md' "$tmp_dir/dist/ai-travel-planning-kit-portable-international.en.md" || fail "English international delta misses operations module"

printf 'Project validation passed.\n'
