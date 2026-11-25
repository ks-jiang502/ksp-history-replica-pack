# KSP 历史复刻包 · 安装说明

> 目标版本：**KSP 1.12.5**（原版坎星尺寸，不含 RSS/RO/RP-1）
> 数据来源：`KSP自用MOD清单.xlsx`（367 行清单 / 19 行「复刻历史包」标签）+ `CKAN-meta-master`（31,448 个 `.ckan`，3,878 个标识符）
> 所有版本都经过 1.12.5 兼容性比对与依赖闭包求解，**冲突检查结果：0**

---

## 1. 目录里有什么

| 文件 | 用途 |
|---|---|
| `KSP历史复刻包清单.xlsx` | **主清单**：总览、复刻包分类、辅助工具、125 个依赖的完整清单、手动安装项、兼容性坑、91 个历史任务对照、安装步骤 |
| `KSP-HistoryReplica-Core.ckan` | 核心包：55 个 MOD，历史部件 + 历史合同包（下载 ~2.7 GB，装完 ~6.9 GB） |
| `KSP-HistoryReplica-Tools.ckan` | 辅助工具包：61 个 MOD（下载 164 MB，装完 253 MB） |
| `KSP-HistoryReplica-Stations.ckan` | 空间站扩展：HabTech2 全家（需 Breaking Ground DLC） |
| `KSP-HistoryReplica-All.ckan` | 全家桶：一次装上面三个（95 个 MOD，下载 ~3.1 GB） |
| `install_pack.ps1` | 用 CKAN 命令行一键装（也可用 CKAN 图形界面，见下） |
| `MOD下载清单.csv` | 每个 MOD 的版本 + 官方下载直链（断网/手动装时用） |

---

## 2. 三分钟装完（CKAN 图形界面）

1. **备份** 存档；把 `GameData` 里同名的旧目录（`BluedogDB`、`Tantares`、`KIU`、`ModuleManager`、`ContractConfigurator`）删掉或移走。
2. 打开 CKAN → `Settings → KSP version` 选 **1.12.5**。
3. `File → Install from .ckan…` → 选 `KSP-HistoryReplica-Core.ckan` → 解析出 55 个依赖 → **Apply changes** → 等下载。
4. 再装 `KSP-HistoryReplica-Tools.ckan`。
5. 想要 ISS 就再装 `-Stations.ckan`（没买 Breaking Ground DLC 会报错，跳过即可）。
6. 点 **Refresh**：正常情况下没有红字。
7. 启动游戏 → **新建生涯档**（历史合同不会向老存档补发）→ 合同按年份逐步解锁。

### 用命令行装

```powershell
# 先更新索引
& "$env:LOCALAPPDATA\CKAN\ckan.exe" update

# 只装核心包（版本已锁定）
.\install_pack.ps1 -Pack core

# 装全家桶，但不锁版本（让 CKAN 自己挑）
.\install_pack.ps1 -Pack all -Unpinned
```

> `.ckan` 是 CKAN 的「元包」（metapackage），本身不含零件，只是一张锁死版本的依赖清单。想卸载就 `ckan remove KSP-HistoryReplica-All`。

---

## 3. 这套包为什么能复刻历史

| 国家/主题 | 包 | 能复刻什么 |
|---|---|---|
| 美国 | **BluedogDB**（1 GB）+ FASA | 先锋、水星、双子座、阿波罗、天空实验室；宇宙神/泰坦/德尔塔系列火箭 |
| 美国 | Coatl-Aerospace-Redux | 航天飞机载荷（哈勃、空间实验室）、旅行者/伽利略等历史探测器 |
| 美国 | MOLE / Corvus CF / Eisenhower / Kerbalized SpaceX / LonesomeRobots | 一号实验室、水星双人舱（假设史）、早期载具、猎鹰 9/星舰、SLS |
| 苏联 | **NewTantares v28.0** + NewTantaresLV + TantaresSP/SAF/IVA + Intercolor 重涂 | 东方号、上升号、联盟号、进步号、礼炮/和平号；R-7、质子号；斯普尼克、月球号、金星号 |
| 中国 | KIU 四件套（Common + 运载 + 载人 + 深空） | 长征系列、神舟、天宫/天和、嫦娥、天问 |
| 欧洲 | Knes | 阿丽亚娜系列、赫尔墨斯航天飞机（带中译） |
| 通用 | ModularLaunchPads | 各种历史发射塔架/发射台 |
| 合同 | ContractConfigurator + HistoryofSpaceflight-Stock | 探空火箭 → ISS 的 91 个历史任务（就是《航天历史节选》那张表的来源） |

这个组合不是我猜的：`ContractConfigurator-HistoryofSpaceflight-Stock` 的元数据 `recommends` 正是 **BluedogDB + NewTantares + ProbesPlus**，和你表里打的「复刻历史包」标签完全重合。

---

## 4. 辅助工具（61 个，核心 49 个）

按用途分组，详见 Excel 的《2 辅助工具》：

- **自动驾驶**：MechJeb2 / MechJebForAll / AtmosphereAutopilot
- **飞行信息**：KerbalEngineerRedux / DockingPortAlignmentIndicator / Trajectories / KEI / WaypointManager / AntennaHelper / OrbitPOInts / ResonantOrbitCalculator / KaptainsLog
- **科学与生涯**：ScienceAlert / RoverScienceCont / KSPLaunchCountdown / ABCORS
- **车间工具**：HangarGrid / EasyVesselSwitch / RCSBuildAid / KerbalJointReinforcementContinued / ReCoupler / FMRSContinued / FilterExtensions / VABOrganizer / WindTunnel / KVVContinued / BetterLoadSaveGame / JanitorsCloset
- **视听**：Chatterer / ShipEffectsContinued / CameraTools / TUFX / Resurfaced / ShowFPS / QuickCursorHider
- **IVA 舱内**：FreeIva / ThroughTheEyesOfaKerbal / EVAEnhancementsContinued / ConnectedLivingSpace / ASETProps / DE-IVAExtension / RasterPropMonitor / AvionicsSystems
- **性能与其他**：PhysicsRangeExtender / VesselMoverContinued / IndicatorLights

被剔除的（实测无效、CKAN 没有、元数据太老）：见 Excel《4 手动安装》，共 22 项，含替代建议。

---

## 5. 必须知道的 6 个坑

1. **SimpleAdjustableFairings 元数据滞后** —— BDB 依赖它，但 CKAN 元数据只写到 1.11.2。装 BDB 时若提示「不兼容的前置」：在 CKAN 里关掉 `Compatible` 过滤，单独装它最新版，再重试。实测 1.12.5 正常。
2. **Tantares 本体不在 CKAN** —— Intercolor 重涂依赖 `Tantares`，靠 `NewTantares v28.0` 的 `provides` 满足。**别升到 v36.0**（那是 KSP 1.1.3 的老版）。
3. **科技树只能装一个** —— 推荐 `CommunityTechTree`（BDB/Tantares/KIU 都有节点）；想要「无人先于载人」再加 `ProbesBeforeCrew`。`HistoricalProgressionTechTree` 只有 1.2.x 元数据且没有 BDB 节点，不要用。
4. **KIU 四件套必须一起** —— `KIUChinese-Common` 是另外三个的前置。
5. **内存/加载** —— BDB 装完约 2.5 GB，加 Intercolor 贴图后总量近 7 GB；首次进游戏加载 5–10 分钟正常，建议 32 GB 内存 + SSD。
6. **历史合同要新开档** —— 老存档不会补发合同；`ChineseModPatches`（作者标注「必须装」）已在核心包里。

---

## 6. 手动补装（CKAN 装不了的）

| MOD | 情况 | 建议 |
|---|---|---|
| Kerwis 中国航天包（KCAP） | 元数据停在 1.12.3 | 手动装；与 KIU 二选一（零件不冲突，但风格重复） |
| KeR-7 | 元数据停在 1.12.3 | 手动装；作者评价「不如 US II」 |
| MIR（BobCat/DECQ） | CKAN 无此 MOD | Spacedock 手动下载；与 Tantares 和平号舱段重复，二选一 |
| CxAerospace | 元数据停在 1.3.0 | 手动装、选装（带 IVA，老材质） |
| HangarExtender | 元数据停在 1.2（实际 1.12 可用） | 手动装，超大载具必备 |
| Final Frontier / Contracts Window+ / CapCom / BetterCrewAssignment / KerbalTelemetry | 元数据停在 1.8–1.12.x | 手动装或跳过 |
| Kerbalism / RP-1 / RSS | 与高科级、原版尺寸冲突 | 另开一套 KSP 实例 |

完整 22 项见 Excel《4 手动安装》，含链接。

---

## 7. 怎么核对这份清单

1. 解压 `CKAN-meta-master.tar.gz` → 31,448 个 `.ckan`（每个 MOD 每个版本的元数据）。
2. 对每个标识符筛出「`ksp_version` 恰为 1.12.5，或 `min ≤ 1.12.5 ≤ max`」的最高版本（两段式如 `1.12` 视为整条 1.12 线；`1.8-1.12` 这种上界按 `1.12.99` 处理）。
3. 从 19 个「复刻历史包」种子做 BFS 依赖闭包，处理 `provides`（Tantares）与 `any_of`。
4. 检查 `conflicts`（要按对方版本比对上下界，`RPM` 声明与 `MechJeb2 ≤ 2.14` 冲突，本包用 2.15.4 所以不触发）、`deprecated`、缺失依赖。
5. 结果写进 `pack_report.json`：核心 55 / 工具 61 / 空间站 9，0 问题。

生成脚本都在 `..\`（`build_pack.py` 求解器、`make_pack.py` 出 `.ckan`、`make_xlsx.py` 出 Excel、`make_csv.py` 出下载表），改种子列表后重跑即可。

---

## 8. 已知不足

- 元数据滞后导致 `KerwisChinaAerospacePack`、`KeR-7`、`CxAerospace` 被 CKAN 判为不兼容，只能手动装。
- 你表里 R146 的 `Historical Progression` 合同包元数据停在 1.2.x，本包用 `History of Spaceflight (Stock)` 替代：任务线更全、标注 1.12 可用、官方推荐 BDB/Tantares（已在 Excel《4 手动安装》列明）。
- 你表里 R147 的 `Historical Progression Tech Tree` 没有 BDB/Tantares 节点配置，改用 `CommunityTechTree`（可加 `ProbesBeforeCrew` 实现「无人先于载人」）。
- `MIR`、`[X] Science!`、`Refocused Camera` 不在 CKAN 索引里。
- BDB 分类补丁在 CKAN 里的「下载大小」与 BDB 本体相同（共用同一个 zip），所以 Excel 总览里的下载量已扣除一次，实际只下一次。
