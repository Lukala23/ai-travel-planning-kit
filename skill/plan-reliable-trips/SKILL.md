---
name: plan-reliable-trips
description: Research and create reliable, source-backed travel plans in Chinese, including destinations, accommodation, local dining, transit, taxis and charters, negotiated transport and scam prevention, payments, connectivity, road trips, borders and tipping, mobile-first photography with reference images, museum screening and Chinese guides, souvenirs, hikes, and foreign-trek route data, logistics, insurance, medical, lodging, food, equipment, and safety. Use when the user provides a destination or trip brief and asks to explore or compare places, choose lodging, food, or transport, design or revise an itinerary, plan around dates, weather, budget, mobility, payments, photography, bookings, driving, international travel, museums, souvenirs, or outdoor safety, or produce a practical Markdown guide, illustrated PDF handbook, quick-reference card, print fallback, or AI-queryable travel package.
---

# 可靠旅行规划

## 数据分层

只使用两类信息，禁止混淆：

1. **固定规划约束**：不会因目的地或旅行方式变化的研究、核验、便利度评估和路线质量标准。读取 [references/planning-principles.md](references/planning-principles.md)。
2. **单次出行参数**：目的地、日期、人数与同行者、预算、交通、体力、兴趣和旅行方式。使用 [assets/trip-brief-template.md](assets/trip-brief-template.md)，每趟旅行开始规划前重新采集。

不要建立默认长期旅行者画像，不要把上一次旅行的预算、同行人、交通方式或兴趣自动带入下一次。只有用户明确说“以后所有旅行都遵守”时，才把该项加入固定规划约束中的“用户确认的长期规则”。

## 每次必须读取

- [references/planning-principles.md](references/planning-principles.md)：固定研究与决策标准；
- [references/source-verification.md](references/source-verification.md)：动态信息、来源与冲突处理；
- [references/output-contract.md](references/output-contract.md)：条件式交付组件与自检；
- 本次任务卡或用户当前消息中可提取的单次参数。

用户没有提交表格时，从自然语言生成一份内部任务卡。先检查核心采集表，再按本次方式加载选填模块；不要强迫用户填写不相关模块，也不要把空白项补成事实。

## 条件加载矩阵

旅行方式和任务类型是可并列叠加的标签，没有固定先后顺序。

| 本次标签 | 额外读取 |
|---|---|
| 新目的地、候选全集、先了解目的地 | [references/destination-research.md](references/destination-research.md) |
| 任何需要过夜的旅行、住宿区域选择、住宿推荐或已订住宿核验 | [references/accommodation.md](references/accommodation.md) |
| 需要生成任何逐日或逐时路线 | [references/route-core.md](references/route-core.md) |
| 行程跨越一顿正餐，或用户需要当地美食、餐厅、市场、街边小店 | [references/dining.md](references/dining.md) |
| 公交、地铁、铁路、航班、轮渡或跨城换乘 | [references/public-transit.md](references/public-transit.md) |
| 出租车、网约车、接送机、包车、私人司机、议价车辆、马车 / 骑乘、突突车、三轮车、摩托车出租、传统船只或其他特殊交通体验 | [references/taxi-charter.md](references/taxi-charter.md) |
| 自驾、租车或公路旅行 | [references/self-drive.md](references/self-drive.md) |
| 任何包含景点、街区、展馆、观景点或徒步景观的可执行路线；或用户明确提出摄影需求 | [references/photography.md](references/photography.md) |
| 博物馆、展览、纪念馆或大型展馆被用户点名；目的地是国家 / 地区首府、知名城市、历史文化城市；或候选扫描发现真正值得纳入的大小展馆 | [references/museum-visits.md](references/museum-visits.md) |
| 展馆、文化景点、市场、手工艺或纪念品购买 | [references/souvenirs.md](references/souvenirs.md) |
| 出境、跨境、国外目的地或国际中转 | [references/international-travel.md](references/international-travel.md) |
| 徒步、登山、步道、越野、峡谷、涉水、冰雪或高海拔 | [references/hiking-rules.md](references/hiking-rules.md)，并同时读取通用路线规则 |
| 用户要求正式攻略文件、完整电子手册、PDF、速查版、打印版、图片 / 截图指引，或可交给 AI 继续提问的旅行资料包 | [references/deliverable-package.md](references/deliverable-package.md) |

直接要求路线时，不必先向用户交付完整候选全集，但必须在内部完成足以支持取舍的候选扫描。只有用户要求“穷举 / 全面了解 / 候选清单”时，才把完整枚举作为独立交付。

## 工作流

### 1. 标准化单次任务

提取目的地范围、完整日期、可用时长、起终点、同行者、过夜与住宿状态、饮食限制、本次方式标签、核心目标、硬约束、预算和已订项目。

- 把未知写成 `未知`，不继承旧任务答案。
- 把“下周、国庆、春天”等相对日期换算并显示；存在歧义时保留条件式表达。
- 只询问会实质改变安全、可行性或总体路线的缺项，最多 3 组问题。
- 不影响主方案的缺项使用显式假设，并提供可替换参数。

### 2. 确定研究深度

区分：

- `探索`：建立目的地候选全集；
- `路线`：生成或修改可执行日程；
- `比较`：比较路线、住宿区、交通或活动；
- `户外`：设计或审查徒步、登山路线；
- `更新`：重新核验已有攻略中的动态信息。

这些任务可以组合，不把“探索 → 路线 → 预订”强制为每次都要经历的顺序。

### 3. 搜索并评价候选

先确认目的地边界和交通结构，再搜索与本次任务相关的候选。过夜旅行主动建立住宿区域和具体住宿候选；跨越用餐时段的路线同时建立代表饮食与餐厅候选。对候选同时评价价值与现实摩擦，尤其检查可达性、营业窗口、预约、排队、体力、费用、行李、停车和安全返回。不要用热度代替适配度，也不要只按地图直线距离判断便利。

### 4. 核验动态事实

联网核验所有会影响“能否去、何时去、花多少钱、是否安全”的信息。无法核验时，只能交付带状态标记的草案；禁止伪造来源、班次、价格、坐标或轨迹。

### 5. 构建方案

根据本次任务卡选择路线，而不是套用旧旅行参数。过夜旅行把路线骨架、具体住宿、周边闲逛与餐饮共同优化，并以全程住宿总价和衍生交通成本控制预算。把重要当地饮食按真实营业、排队与绕行排入每天，不用网红名单替代研究。解释关键取舍并给出不成立时的替代方案。

### 6. 条件式交付

只输出本次需要的组件。过夜旅行必须使用住宿基点并形成住宿结论；住宿已经确定时核验它对路线的影响，不无故生成替代榜单。跨越用餐时段的路线必须安排可执行的用餐区域或已筛选餐厅，但不强迫每餐固定一家店。不要为了满足模板而生成无关的自驾、徒步或摄影章节。

用户确认路线并要求正式文件时，以同一权威内容源派生完整电子版、速查版和必要的打印应急版；不得分别维护多套互相矛盾的行程。

## 规则优先级

发生冲突时按以下顺序处理：

`安全与法律 > 当前官方状态 > 本次硬约束 > 已确认预订 > 本次偏好 > 便利与体验优化 > 内容丰富度`

任何单次参数都不能覆盖安全、法律和事实核验底线。
