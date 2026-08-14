# 在不同 AI Agent 中安装和使用

[English](agent-platforms.en.md)

> 文档最近核验：2026-08-14。Agent 产品更新很快；如果界面、目录或命令发生变化，请优先查看本节链接的官方说明，并欢迎提交 Issue 更新本文档。

**AI 旅行规划工具包（AI Travel Planning Kit）**的核心是标准 `SKILL.md` 加一组按需读取的规则文件。不同软件对 Agent Skills 的支持方式不完全相同，因此不要把所有产品都理解成“安装到 Codex”。

本项目提供三种使用方法：

1. **原生 Skill**：软件识别 `SKILL.md`，能自动或手动调用，并按任务读取相关文件；
2. **工作区规则**：把技能目录放进某个旅行项目的规则 / Skills 目录，只对这个项目生效；
3. **上传或引用文件**：软件不支持完整 Skill 时，上传核心规则和本次需要的模块，让 AI 先读取再规划。

## 先下载项目

会使用 Git 的用户：

```bash
git clone https://github.com/Lukala23/ai-travel-planning-kit.git
cd ai-travel-planning-kit
```

不使用命令行的用户可以在 GitHub 首页选择 `Code → Download ZIP`。如果平台要求上传“技能包”，请直接下载 [Releases](https://github.com/Lukala23/ai-travel-planning-kit/releases/latest) 中名为 `plan-reliable-trips-skill.zip` 的文件，不要自行猜测应该压缩哪一层目录。不支持原生 Skill、只接受文档上传的 AI，先使用同一 Release 中的 `ai-travel-planning-kit-portable-core.md`，再按任务增加场景包。

无论在哪个平台使用，真正的技能目录都是：

```text
skill/plan-reliable-trips/
├── SKILL.md
├── agents/openai.yaml
├── assets/
└── references/
```

## 平台选择速查

| 平台 | 推荐方法 | 推荐调用方式 | 需要注意 |
|---|---|---|---|
| Codex | 安装为个人 Skill | `$plan-reliable-trips` | 个人目录可跨项目使用 |
| TRAE | SOLO 中导入，或项目 `.trae/skills/` | “使用 plan-reliable-trips 技能……” | 官方中文社区目前说明 Skills 在 SOLO 中完整触发 |
| WorkBuddy | 上传 Release 技能包 | 在任务中直接描述旅行需求 | 上传后确认技能已启用；也可把仓库作为工作区并 `@` 引用文件 |
| Claude Code | 个人或项目 Skill | `/plan-reliable-trips` 或自然语言触发 | 个人与项目目录作用范围不同 |
| Cursor | 项目 / 个人 Skills，或 GitHub 导入 | `/plan-reliable-trips` 或自然语言触发 | 可使用 `.cursor/skills` 或开放标准目录 `.agents/skills` |
| Windsurf | 工作区或全局 Skill | `@plan-reliable-trips` 或自然语言触发 | 团队共享时优先工作区目录 |
| GitHub Copilot | 仓库或个人 Agent Skill | 在 Agent 模式提出旅行任务 | 适合把工具包随自己的旅行仓库版本管理 |
| Gemini CLI | `gemini skills link` | 自然语言触发，必要时明确技能名 | 链接后可用 CLI 查看和启停 |
| 普通 AI 对话工具 | 上传所需 Markdown | 明确要求先读文件再规划 | 没有联网或文件能力时，动态信息仍需人工补充 |

## OpenAI Codex

OpenAI 当前文档说明，个人 Skills 放在 `~/.agents/skills`，仓库级 Skill 放在仓库向上扫描范围内的 `.agents/skills`；符号链接受支持。参见 [Build skills](https://learn.chatgpt.com/docs/build-skills)。部分旧版或兼容环境仍能读取 `~/.codex/skills`，但新安装优先使用官方当前目录。

在 macOS / Linux 中建立链接：

```bash
mkdir -p ~/.agents/skills
ln -s "$PWD/skill/plan-reliable-trips" ~/.agents/skills/plan-reliable-trips
```

如果目标目录已有同名内容，先比较或备份，不要直接覆盖。Windows 用户可以把整个 `plan-reliable-trips` 文件夹复制到个人 Codex Skills 目录。

本项目在 OpenAI 元数据中关闭隐式调用，避免普通旅行对话误载整套 Skill。在新的 Codex 任务中显式调用：

```text
使用 $plan-reliable-trips。

请先根据我的描述整理本次出行任务卡，只追问会真正改变方案的问题。
目的地：……
日期：……
人数：……
预算：……
最重要的体验：……
```

## TRAE

根据 [TRAE 官方中文社区的 Skills 说明](https://forum.trae.cn/t/topic/809)，可以从创建页面导入已有 Skill、使用 GitHub Skill 地址，或把技能放进项目的 `.trae/skills/`；该说明同时注明 Skills 当前需要在 SOLO 模式中完整触发。

### 方法 A：在 SOLO 中导入 GitHub Skill

使用这个技能目录地址：

```text
https://github.com/Lukala23/ai-travel-planning-kit/tree/main/skill/plan-reliable-trips
```

如果当前版本无法识别仓库中的子目录，改用 Release 技能包，或使用下面的项目目录方法。

### 方法 B：放进某个项目

把整个 `skill/plan-reliable-trips` 文件夹复制为：

```text
你的旅行项目/.trae/skills/plan-reliable-trips/
```

确认最终路径中直接存在 `SKILL.md`，不要多套一层重复文件夹。

进入 SOLO 后可以说：

```text
使用 plan-reliable-trips 技能。先帮我研究这次旅行的住宿区域、
核心体验和交通骨架，等我确认关键选择后再生成完整行程。
```

## WorkBuddy

WorkBuddy 的 [技能市场与本地技能说明](https://www.workbuddy.cn/docs/workbuddy/From-Beginner-to-Expert-Guide/Function-Description/Skills-Market) 提供了“添加技能 → 上传技能”的本地导入方式；其 [创建任务说明](https://www.workbuddy.cn/docs/workbuddy/Create-Task) 也支持选择工作区、`@` 引用规则或文档，以及上传文件。

### 推荐方法：上传现成技能包

1. 从本项目 [Releases](https://github.com/Lukala23/ai-travel-planning-kit/releases/latest) 下载 `plan-reliable-trips-skill.zip`；
2. 打开 WorkBuddy 的技能页面；
3. 选择“添加技能 → 上传技能”；
4. 上传压缩包，确认 `AI 旅行规划工具包` 已出现在技能列表并处于启用状态；
5. 新建任务，直接输入本次目的地、日期、人数、预算和核心目标。

建议只启用当前任务真正需要的技能。第三方技能可能包含脚本或额外权限，上传前应查看来源和内容；本项目的旅行 Skill 目前只包含 Markdown 规则与任务表，不要求账号密码、支付凭据或外部执行权限。

### 备用方法：作为工作区文件使用

如果当前 WorkBuddy 版本无法导入技能包：

1. 把本仓库设为任务工作区，或把 `skill/plan-reliable-trips` 复制到你的旅行资料目录；
2. 在任务中 `@` 引用 `SKILL.md`、核心规则和本次任务表；
3. 明确要求 AI 先读取文件，再按条件加载相关模块；
4. 让输出保存到单独的本次旅行目录，不要修改工具包原始规则，除非你正在审阅长期偏好。

示例：

```text
请先读取 @skill/plan-reliable-trips/SKILL.md 和它指向的核心规则，
再根据这次出行信息规划。先输出任务卡和关键取舍，不要立刻写完整攻略。
```

## Claude Code

Claude Code 官方的 [Extend Claude with skills](https://code.claude.com/docs/en/slash-commands) 说明，个人技能可以放在 `~/.claude/skills/<skill-name>/SKILL.md`，项目技能可以放在 `.claude/skills/<skill-name>/SKILL.md`，并支持开放的 Agent Skills 结构。

个人安装示例：

```bash
mkdir -p ~/.claude/skills
ln -s "$PWD/skill/plan-reliable-trips" ~/.claude/skills/plan-reliable-trips
```

只想在某个旅行工作区使用时，把它复制到：

```text
旅行工作区/.claude/skills/plan-reliable-trips/
```

可以用 `/plan-reliable-trips` 手动调用，也可以直接描述旅行需求让 Agent 根据技能描述自动选择。

## Cursor

Cursor 官方 [Agent Skills 文档](https://cursor.com/docs/skills) 支持开放的 Agent Skills 标准、项目或个人目录，也提供从 GitHub 导入规则 / 技能的入口。

推荐放进旅行工作区的任一目录：

```text
旅行工作区/.cursor/skills/plan-reliable-trips/
旅行工作区/.agents/skills/plan-reliable-trips/
```

个人使用可以放在：

```text
~/.cursor/skills/plan-reliable-trips/
~/.agents/skills/plan-reliable-trips/
```

也可以在 Cursor 的 Rules 设置中选择从 GitHub 添加，填写本仓库地址；如果远程导入没有识别嵌套技能目录，使用手动复制方式。安装后用 `/plan-reliable-trips` 或直接说“使用 AI 旅行规划工具包……”开始。

## Windsurf

Windsurf 官方 [Cascade Skills 文档](https://docs.windsurf.com/windsurf/cascade/skills) 提供工作区和全局 Skills 目录。

团队或单个旅行工作区：

```text
旅行工作区/.windsurf/skills/plan-reliable-trips/
```

个人全局使用：

```text
~/.codeium/windsurf/skills/plan-reliable-trips/
```

复制后确认 `SKILL.md` 位于上述目录的第一层。可在 Cascade 中明确写 `@plan-reliable-trips`，或用自然语言要求它使用该技能。

## GitHub Copilot

GitHub 官方 [About agent skills](https://docs.github.com/en/copilot/concepts/agents/about-agent-skills) 说明，仓库级技能可放在 `.github/skills`、`.agents/skills` 等支持目录，个人技能也可以放入个人 Skills 目录。

如果你把每次旅行保存在自己的 GitHub 仓库中，可以复制为：

```text
你的旅行仓库/.github/skills/plan-reliable-trips/
```

或使用开放目录：

```text
你的旅行仓库/.agents/skills/plan-reliable-trips/
```

然后在支持 Agent Skills 的 Copilot Agent / CLI 场景中提出旅行任务。若某个 Copilot 界面只支持普通附件或仓库上下文，就按本文最后的“普通文件上传模式”使用。

## Gemini CLI

Gemini CLI 官方 [Using Agent Skills](https://geminicli.com/docs/cli/using-agent-skills/) 支持用户级和工作区级 Skills，也提供安装、链接、启用与禁用命令。

在本仓库根目录执行：

```bash
gemini skills link "$PWD/skill/plan-reliable-trips"
```

如果只希望某个工作区使用，也可以把技能放进该工作区的 `.gemini/skills/` 或 `.agents/skills/`。链接后先用 Gemini CLI 的 Skills 列表命令确认已经发现，再输入本次旅行请求。

## 其他支持文件上传的 AI

如果使用的软件没有原生 Agent Skills，也可以把这套工具作为一组“规划参考文件”。不要一开始上传所有专项规则；按本次任务选择，既节省上下文，也能减少无关输出。

### 每次先提供

上传 Release 中的 `ai-travel-planning-kit-portable-core.md`。它包含 Skill 路由和两份精简通用规则，不包含完整任务卡或全部专项模块。

### 再按场景提供增量包

下列文件只包含专项模块，不重复核心路由；必须与 core 搭配，而不是单独上传。

| 本次任务 | 增加文件 |
|---|---|
| 城市候选、逐日路线、需要研究的住宿 / 餐饮、公共交通 | `ai-travel-planning-kit-portable-city.md` |
| 航空链路、国外 / 跨境 / 国际中转、触发后的健康与保险提醒 | `ai-travel-planning-kit-portable-international.md` |
| 租车、自驾、徒步、户外、相关健康与保障提醒 | `ai-travel-planning-kit-portable-road-outdoor.md` |

摄影、展馆、纪念品、包车或正式资料包等不在场景包中的专项，只在真正触发时从 Skill 压缩包增加对应 `references/*.md`。完整 `ai-travel-planning-kit-portable.md` 仅作向后兼容和归档，不是默认上下文。用户已填写或复杂任务确实需要时才增加高级任务卡。

然后输入：

```text
请按我上传的核心规则，只读取和输出当前问题真正需要的模块。
从自然语言提取必要条件，未知信息保持未知，不继承其他旅行参数。
先完成最小充分研究；只有我明确要求时再扩展为完整旅行方案或正式文件。
```

如果平台不能联网，要求它先输出“待核验清单”和需要打开的官方来源类型，不要让它把旧知识写成当前事实。

## 怎样判断安装成功

用这个短测试，而不是一开始就让它规划十天行程：

```text
请说明你是否已经读取 plan-reliable-trips 技能。
我只告诉你“明年春天两个人去尼泊尔”，请不要直接排路线；
先列出你会建立的本次任务卡、真正需要追问的关键信息，
以及本次会按条件加载哪些规则文件。
```

正确表现应包括：

- 不继承旧旅行的预算、人数、体力和兴趣；
- 不强迫一次填写所有模块；
- 把日期、目的地范围、预算、徒步与否、能力和已订项目视为本次参数；
- 因为尚未提出具体问题，不直接加载出入境、住宿或交通全文；只说明何种后续问题会触发它们，并在徒步真正进入当前范围时再加载徒步与轨迹审核；
- 若要求检查路由，可用 `调试加载` 显示三项配置和实际读取文件；正常旅行回答不显示内部过程；
- 不在没有当前资料的情况下编造价格、签证、天气或步道状态。

## 更新技能

如果使用的是 Git 克隆和符号链接：

```bash
git pull --ff-only
```

如果使用上传包或手动复制，请下载新 Release，阅读变更，再替换旧版本。先备份你自己修改过的偏好；不要用更新包直接覆盖尚未提交的个人规则。
