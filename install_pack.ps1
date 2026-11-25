# 用 CKAN 命令行批量安装（需要 ckan.exe，先 update 一次索引）
param(
  [string]$Ckan = "$env:LOCALAPPDATA\CKAN\ckan.exe",
  [ValidateSet('core','tools','stations','all')][string]$Pack = 'core',
  [switch]$Unpinned
)

if (-not (Test-Path $Ckan)) { Write-Error "找不到 ckan.exe，请用 -Ckan 指定路径（或改用 CKAN 图形界面 File > Install from .ckan）"; exit 1 }

$sets = @{
  core = @("BluedogDB=v1.14.0", "BluedogDB-CommunityCategoryKit=v1.14.0", "FASA=1:v7.2.7", "NewTantares=v28.0", "IntercolorTantaresRecolors=6.0 DA BIG ONE (not really)", "NewTantaresLV=v16.2", "TantaresSP=6.0", "TantaresSAF=v3.0", "TantaresIVAExpansion=v1.0.1", "Knes=v1.9.9", "Coatl-Aerospace-Redux=0.18.0.2", "EisenhowerAstronautics=v1.1.0", "TheLonesomeRobotsCollection=0.2.0", "Kerbalized-SpaceX=1.26", "Corvus125mTwoKerbalPod=2:1.3.7", "MOLE=v1.31.2", "ModularLaunchPads=2.9.1", "KIUChinese-Common=1.0.7 - Hotfix", "KIUChineseHumanSpaceflightPack=1:1.0.11 - Hotfix v2", "KIUChineseLaunchVehiclePack=1.1.12 - Hotfix", "KIUChineseDeepspaceExplorationPack=1.0.7 - Hotfix", "ContractConfigurator=v2.14.0.0", "ContractConfigurator-HistoryofSpaceflight-Stock=1.0", "ModuleManager=4.2.3", "ChineseModPatches=v1.8.5")
  tools = @("MechJeb2=2.15.4.0", "MechJebForAll=1.3.0.7", "KerbalEngineerRedux=1.1.9.5", "DockingPortAlignmentIndicator=6.13.1.0", "Trajectories=v2.4.5.6", "ScienceAlert=1.9.20.5", "KEI=1.2.10.7", "WaypointManager=2.8.5.2", "KaptainsLog=0.1.8.2", "HangarGrid=1:0.4.1.2", "EasyVesselSwitch=2.3", "AtmosphereAutopilot=v1.6.1", "RCSBuildAid=v1.0.6", "KerbalJointReinforcementContinued=v3.9.0.0", "ReCoupler=1:1.4.0", "FMRSContinued=1.2.9.6", "SpeedUnitAnnex=1.6.1", "Chatterer=0.9.99", "ShipEffectsContinued=1.0.13", "PhysicsRangeExtender=1.21.0", "JanitorsCloset=0.4.1.9", "KSPLaunchCountdown=0.2.7", "QuickCursorHider=1:1.1.0.10", "ShowFPS=1:0.3.3", "CameraTools=v1.37.1", "WindTunnel=2.1.1.1", "KVVContinued=0.1.2", "FilterExtensions=3.2.9.1", "FilterExtensionsDefaultConfig=3.2.9.1", "VABOrganizer=1.2.0", "ABCORS=0.5.4", "BetterLoadSaveGame=2.5.3.7", "VesselMoverContinued=v1.12.0", "IndicatorLights=1.8.3", "AntennaHelper=2:1.0.7.8", "ResonantOrbitCalculator=0.0.8.1", "RoverScienceCont=2.3.5.11", "OrbitPOInts=v0.6.1", "TrackingStationEvolved=7.0", "FreeIva=0.2.20.2", "ThroughTheEyesOfaKerbal=2.0.4.5", "EVAEnhancementsContinued=0.1.15.3", "ConnectedLivingSpace=v2.0.2.0", "ASETProps=v2.0.7", "DE-IVAExtension=v1.3.0", "RasterPropMonitor=1:v1.1.0.1", "AvionicsSystems=v1.3.7", "TUFX=1.1.1", "Resurfaced=v1.3")
  stations = @("HabTech2=1.1.0", "HabTechProps=v0.2.0", "HabTechRobotics=v1.0.1")
}

$ids = if ($Pack -eq 'all') { $sets.core + $sets.tools + $sets.stations } else { $sets[$Pack] }
if ($Unpinned) { $ids = $ids | ForEach-Object { ($_ -split '=')[0] } }
Write-Host "安装 $($ids.Count) 个 MOD（KSP 1.12.5）..."
& $Ckan install @ids

# 装完后在 CKAN 里点 Refresh，确认没有红色不兼容项；
# 未收录的手动 MOD 见 README-安装说明.md 第 5 节。
