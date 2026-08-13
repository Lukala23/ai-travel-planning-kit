#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd "$script_dir/.." && pwd)"
output_dir="${1:-$repo_root/dist}"
skill_source="$repo_root/skill/plan-reliable-trips"
stage_dir="$(mktemp -d)"

cleanup() {
  rm -rf "$stage_dir"
}
trap cleanup EXIT

mkdir -p "$output_dir"
rm -f \
  "$output_dir/plan-reliable-trips-skill.zip" \
  "$output_dir/ai-travel-planning-kit-portable.md" \
  "$output_dir/SHA256SUMS.txt"

cp -R "$skill_source" "$stage_dir/plan-reliable-trips"
(
  cd "$stage_dir"
  zip -qr "$output_dir/plan-reliable-trips-skill.zip" plan-reliable-trips
)

portable_file="$output_dir/ai-travel-planning-kit-portable.md"
{
  printf '# AI 旅行规划工具包（AI Travel Planning Kit）便携单文件版\n\n'
  printf '> 由仓库中的模块化 Skill 自动生成，适合上传到不支持原生 Agent Skills、但能读取 Markdown 的 AI。\n'
  printf '> 权威源仍是仓库中的模块文件；需要修改长期规则时，请修改源文件并重新构建，不要同时维护两套内容。\n\n'
  printf '使用时请先让 AI 阅读本文档，再提供本次目的地、日期、人数、预算、已订项目和核心目标。\n\n'

  files=(
    "skill/plan-reliable-trips/SKILL.md"
    "skill/plan-reliable-trips/assets/trip-brief-template.md"
    "skill/plan-reliable-trips/references/planning-principles.md"
    "skill/plan-reliable-trips/references/source-verification.md"
    "skill/plan-reliable-trips/references/output-contract.md"
    "skill/plan-reliable-trips/references/destination-research.md"
    "skill/plan-reliable-trips/references/accommodation.md"
    "skill/plan-reliable-trips/references/dining.md"
    "skill/plan-reliable-trips/references/route-core.md"
    "skill/plan-reliable-trips/references/public-transit.md"
    "skill/plan-reliable-trips/references/taxi-charter.md"
    "skill/plan-reliable-trips/references/self-drive.md"
    "skill/plan-reliable-trips/references/international-travel.md"
    "skill/plan-reliable-trips/references/museum-visits.md"
    "skill/plan-reliable-trips/references/photography.md"
    "skill/plan-reliable-trips/references/hiking-rules.md"
    "skill/plan-reliable-trips/references/souvenirs.md"
    "skill/plan-reliable-trips/references/deliverable-package.md"
  )

  for relative_file in "${files[@]}"; do
    printf '\n---\n\n## 源文件：`%s`\n\n' "$relative_file"
    awk '
      NR == 1 && $0 == "---" { in_frontmatter = 1; next }
      in_frontmatter && $0 == "---" { in_frontmatter = 0; next }
      !in_frontmatter { print }
    ' "$repo_root/$relative_file" | perl -pe '
      s{\[([^\]]+)\]\(((?:references|assets)/[^)]+)\)}{$1 . "（见本单文件中的源文件：`" . $2 . "`）"}ge
    '
    printf '\n'
  done
} > "$portable_file"

(
  cd "$output_dir"
  shasum -a 256 \
    plan-reliable-trips-skill.zip \
    ai-travel-planning-kit-portable.md > SHA256SUMS.txt
)

printf 'Built release assets in %s\n' "$output_dir"
