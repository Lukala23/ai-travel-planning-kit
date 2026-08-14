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
output_dir="$(cd "$output_dir" && pwd)"
rm -f \
  "$output_dir/plan-reliable-trips-skill.zip" \
  "$output_dir/plan-reliable-trips-en-skill.zip" \
  "$output_dir/ai-travel-planning-kit-portable-core.md" \
  "$output_dir/ai-travel-planning-kit-portable-city.md" \
  "$output_dir/ai-travel-planning-kit-portable-international.md" \
  "$output_dir/ai-travel-planning-kit-portable-road-outdoor.md" \
  "$output_dir/ai-travel-planning-kit-portable.md" \
  "$output_dir/ai-travel-planning-kit-portable-core.en.md" \
  "$output_dir/ai-travel-planning-kit-portable-city.en.md" \
  "$output_dir/ai-travel-planning-kit-portable-international.en.md" \
  "$output_dir/ai-travel-planning-kit-portable-road-outdoor.en.md" \
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
  local profile="$4"
  local portable_file="$output_dir/$portable_name"
  local files=()

  case "$profile" in
    core)
      files=(
        "SKILL.md"
        "references/source-verification.md"
        "references/output-contract.md"
      )
      ;;
    city)
      files+=(
        "references/destination-research.md"
        "references/route-core.md"
        "references/accommodation.md"
        "references/dining.md"
        "references/public-transit.md"
      )
      ;;
    international)
      files+=(
        "references/air-travel.md"
        "references/entry-and-transit.md"
        "references/international-operations.md"
        "references/health-and-medical.md"
        "references/travel-insurance.md"
      )
      ;;
    road-outdoor)
      files+=(
        "references/route-core.md"
        "references/self-drive.md"
        "references/hiking-rules.md"
        "references/health-and-medical.md"
        "references/travel-insurance.md"
      )
      ;;
    full)
      files=(
        "SKILL.md"
        "references/source-verification.md"
        "references/output-contract.md"
        "assets/trip-brief-template.md"
        "references/destination-research.md"
        "references/accommodation.md"
        "references/dining.md"
        "references/route-core.md"
        "references/air-travel.md"
        "references/public-transit.md"
        "references/taxi-charter.md"
        "references/self-drive.md"
        "references/entry-and-transit.md"
        "references/international-operations.md"
        "references/health-and-medical.md"
        "references/travel-insurance.md"
        "references/museum-visits.md"
        "references/photography.md"
        "references/hiking-rules.md"
        "references/souvenirs.md"
        "references/deliverable-package.md"
      )
      ;;
    *)
      printf 'Unknown portable profile: %s\n' "$profile" >&2
      return 1
      ;;
  esac

  {
    if [[ "$language" == "zh" ]]; then
      printf '# AI 旅行规划工具包便携版：%s\n\n' "$profile"
      if [[ "$profile" == "full" ]]; then
        printf '> 由模块化中文 Skill 自动生成，包含核心路由与全部专项模块。\n'
        printf '> AI 必须继续遵守 SKILL.md 的触发条件，不得因为某模块存在于本文就自动输出它。\n'
        printf '> 这是向后兼容的完整归档，不建议普通任务整份读取；优先使用核心包或最接近任务的场景包。\n\n'
      elif [[ "$profile" == "core" ]]; then
        printf '> 核心包包含 SKILL 路由和两份通用支持规则，是文件上传模式的起点。\n'
        printf '> 需要专项研究时再追加一个最接近当前任务的场景增量包；不要预先上传所有模块。\n\n'
      else
        printf '> 这是场景增量包，只含当前场景的专项模块，不重复核心规则。使用前必须同时提供核心包。\n'
        printf '> AI 仍须按核心包中的触发门槛选择模块；不要因为文件已上传就自动输出全部章节。\n\n'
      fi
      printf '先提供本次旅行问题。普通任务不要求填写完整任务卡，也不默认生成完整攻略。\n\n'
    else
      printf '# AI Travel Planning Kit portable edition: %s\n\n' "$profile"
      if [[ "$profile" == "full" ]]; then
        printf '> Generated from the origin-neutral English Skill with the core router and every specialist module.\n'
        printf '> The AI must still follow SKILL.md triggers and must not emit a module merely because it is bundled here.\n'
        printf '> This is a backward-compatible full archive, not the recommended default context. Prefer the core or closest scenario pack.\n\n'
      elif [[ "$profile" == "core" ]]; then
        printf '> The core pack contains the Skill router and two shared support rules. Start here in file-upload mode.\n'
        printf '> Add one closest scenario delta only when specialist research is needed; do not upload every module in advance.\n\n'
      else
        printf '> This is a scenario delta: it contains specialist modules only and does not repeat the core. Provide the core pack with it.\n'
        printf '> The AI must still apply the core trigger gate and must not emit every uploaded module.\n\n'
      fi
      printf 'Provide the current travel question first. An ordinary task does not require the full brief or a complete guide.\n\n'
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
          s{\[([^\]]+)\]\(((?:references|assets)/[^)]+)\)}{$1 . "（按需补充源文件：`" . $2 . "`）"}ge;
          s{\[([^\]]+)\]\(([^/()]+\.md)\)}{$1 . "（按需补充源文件：`references/" . $2 . "`）"}ge
        '
      else
        awk '
          NR == 1 && $0 == "---" { in_frontmatter = 1; next }
          in_frontmatter && $0 == "---" { in_frontmatter = 0; next }
          !in_frontmatter { print }
        ' "$repo_root/$relative_file" | perl -pe '
          s{\[([^\]]+)\]\(((?:references|assets)/[^)]+)\)}{$1 . " (add only when needed: `" . $2 . "`)"}ge;
          s{\[([^\]]+)\]\(([^/()]+\.md)\)}{$1 . " (add only when needed: `references/" . $2 . "`)"}ge
        '
      fi
      printf '\n'
    done
  } > "$portable_file"
}

build_skill_zip "plan-reliable-trips" "plan-reliable-trips-skill.zip"
build_skill_zip "plan-reliable-trips-en" "plan-reliable-trips-en-skill.zip"

build_portable_file "plan-reliable-trips" "ai-travel-planning-kit-portable-core.md" "zh" "core"
build_portable_file "plan-reliable-trips" "ai-travel-planning-kit-portable-city.md" "zh" "city"
build_portable_file "plan-reliable-trips" "ai-travel-planning-kit-portable-international.md" "zh" "international"
build_portable_file "plan-reliable-trips" "ai-travel-planning-kit-portable-road-outdoor.md" "zh" "road-outdoor"
build_portable_file "plan-reliable-trips" "ai-travel-planning-kit-portable.md" "zh" "full"

build_portable_file "plan-reliable-trips-en" "ai-travel-planning-kit-portable-core.en.md" "en" "core"
build_portable_file "plan-reliable-trips-en" "ai-travel-planning-kit-portable-city.en.md" "en" "city"
build_portable_file "plan-reliable-trips-en" "ai-travel-planning-kit-portable-international.en.md" "en" "international"
build_portable_file "plan-reliable-trips-en" "ai-travel-planning-kit-portable-road-outdoor.en.md" "en" "road-outdoor"
build_portable_file "plan-reliable-trips-en" "ai-travel-planning-kit-portable.en.md" "en" "full"

(
  cd "$output_dir"
  shasum -a 256 \
    plan-reliable-trips-skill.zip \
    plan-reliable-trips-en-skill.zip \
    ai-travel-planning-kit-portable-core.md \
    ai-travel-planning-kit-portable-city.md \
    ai-travel-planning-kit-portable-international.md \
    ai-travel-planning-kit-portable-road-outdoor.md \
    ai-travel-planning-kit-portable.md \
    ai-travel-planning-kit-portable-core.en.md \
    ai-travel-planning-kit-portable-city.en.md \
    ai-travel-planning-kit-portable-international.en.md \
    ai-travel-planning-kit-portable-road-outdoor.en.md \
    ai-travel-planning-kit-portable.en.md > SHA256SUMS.txt
)

printf 'Built bilingual skill archives and tiered portable packs in %s\n' "$output_dir"
