#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd "$script_dir/.." && pwd)"
output_dir="${1:-$repo_root/dist}"
stage_dir="$(mktemp -d)"

cleanup() {
  rm -rf "$stage_dir"
}
trap cleanup EXIT

mkdir -p "$output_dir"
rm -f \
  "$output_dir/plan-reliable-trips-skill.zip" \
  "$output_dir/plan-reliable-trips-en-skill.zip" \
  "$output_dir/ai-travel-planning-kit-portable.md" \
  "$output_dir/ai-travel-planning-kit-portable.en.md" \
  "$output_dir/SHA256SUMS.txt"

build_skill_zip() {
  local skill_name="$1"
  local archive_name="$2"

  cp -R "$repo_root/skill/$skill_name" "$stage_dir/$skill_name"
  (
    cd "$stage_dir"
    zip -qr "$output_dir/$archive_name" "$skill_name"
  )
}

build_portable_file() {
  local skill_name="$1"
  local portable_name="$2"
  local language="$3"
  local portable_file="$output_dir/$portable_name"
  local files=(
    "SKILL.md"
    "assets/trip-brief-template.md"
    "references/planning-principles.md"
    "references/source-verification.md"
    "references/output-contract.md"
    "references/destination-research.md"
    "references/accommodation.md"
    "references/dining.md"
    "references/route-core.md"
    "references/public-transit.md"
    "references/taxi-charter.md"
    "references/self-drive.md"
    "references/international-travel.md"
    "references/museum-visits.md"
    "references/photography.md"
    "references/hiking-rules.md"
    "references/souvenirs.md"
    "references/deliverable-package.md"
  )

  {
    if [[ "$language" == "zh" ]]; then
      printf '# AI 旅行规划工具包（AI Travel Planning Kit）便携单文件版\n\n'
      printf '> 由仓库中的模块化中文 Skill 自动生成，适合上传到不支持原生 Agent Skills、但能读取 Markdown 的 AI。\n'
      printf '> 权威源仍是仓库中的模块文件；需要修改长期规则时，请修改源文件并重新构建，不要同时维护两套内容。\n\n'
      printf '使用时请先让 AI 阅读本文档，再提供本次目的地、日期、人数、预算、已订项目和核心目标。\n\n'
    else
      printf '# AI Travel Planning Kit: portable single-file edition\n\n'
      printf '> Generated from the modular English Skill for AI products that can read Markdown but do not support native Agent Skills.\n'
      printf '> The modular repository files remain authoritative. Edit and rebuild the source rather than maintaining a second rule set here.\n\n'
      printf 'Ask the AI to read this document first, then provide this trip\x27s destination, dates, travelers, budget, confirmed bookings, and core goals.\n\n'
    fi

    for file_in_skill in "${files[@]}"; do
      local relative_file="skill/$skill_name/$file_in_skill"
      if [[ "$language" == "zh" ]]; then
        printf '\n---\n\n## 源文件：`%s`\n\n' "$relative_file"
      else
        printf '\n---\n\n## Source file: `%s`\n\n' "$relative_file"
      fi

      if [[ "$language" == "zh" ]]; then
        awk '
          NR == 1 && $0 == "---" { in_frontmatter = 1; next }
          in_frontmatter && $0 == "---" { in_frontmatter = 0; next }
          !in_frontmatter { print }
        ' "$repo_root/$relative_file" | perl -pe '
          s{\[([^\]]+)\]\(((?:references|assets)/[^)]+)\)}{$1 . "（见本单文件中的源文件：`" . $2 . "`）"}ge
        '
      else
        awk '
          NR == 1 && $0 == "---" { in_frontmatter = 1; next }
          in_frontmatter && $0 == "---" { in_frontmatter = 0; next }
          !in_frontmatter { print }
        ' "$repo_root/$relative_file" | perl -pe '
          s{\[([^\]]+)\]\(((?:references|assets)/[^)]+)\)}{$1 . " (see bundled source: `" . $2 . "`)"}ge
        '
      fi
      printf '\n'
    done
  } > "$portable_file"
}

build_skill_zip "plan-reliable-trips" "plan-reliable-trips-skill.zip"
build_skill_zip "plan-reliable-trips-en" "plan-reliable-trips-en-skill.zip"
build_portable_file "plan-reliable-trips" "ai-travel-planning-kit-portable.md" "zh"
build_portable_file "plan-reliable-trips-en" "ai-travel-planning-kit-portable.en.md" "en"

(
  cd "$output_dir"
  shasum -a 256 \
    plan-reliable-trips-skill.zip \
    plan-reliable-trips-en-skill.zip \
    ai-travel-planning-kit-portable.md \
    ai-travel-planning-kit-portable.en.md > SHA256SUMS.txt
)

printf 'Built bilingual release assets in %s\n' "$output_dir"
