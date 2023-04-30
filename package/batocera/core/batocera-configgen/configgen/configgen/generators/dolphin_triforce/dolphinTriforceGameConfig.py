#!/usr/bin/env python
import Command
import batoceraFiles
from generators.Generator import Generator
import shutil
import os.path
from os import environ
import configparser

cfg_fzero = batoceraFiles.dolphinTriforceGameSettings + "/SBGG.ini"
cfg_vs42006 = batoceraFiles.dolphinTriforceGameSettings + "/SBLL.ini"
cfg_mkagp =batoceraFiles.dolphinTriforceGameSettings + "/SBKP.ini"
cfg_mkagp2 = batoceraFiles.dolphinTriforceGameSettings + "/SBNL.ini"

def generateGameConfig():
    if not os.path.exists(batoceraFiles.dolphinTriforceGameSettings):
        os.makedirs(batoceraFiles.dolphinTriforceGameSettings)

    #F-Zero
    if not os.path.exists(cfg_fzero):
        with open(cfg_fzero, "w") as script:
            script.write("""[Gecko]
$Widescreen
044461B4 3FE40000
$Infinite Time
0437C964 EA000000
$Infinite Energy
04C43a04 42C80000
[OnFrame]
$Advertise Sound ON
0x803D0175:byte:0x00000001
$Advertise Sound OFF
0x803D0175:byte:0x00000000
$Game Difficulty (very easy)
0x803D0176:byte:0x00000000
$Game Difficulty (easy)
0x803D0176:byte:0x00000001
$Game Difficulty (normal)
0x803D0176:byte:0x00000002
$Game Difficulty (hard)
0x803D0176:byte:0x00000003
$Game Difficulty (hardest)
0x803D0176:byte:0x00000004
$Race Mode Laps (normal)
0x803D0179:byte:0x00000000
$Race Mode Laps (set 1)
0x803D0179:byte:0x00000001
$Race Mode Laps (set 2)
0x803D0179:byte:0x00000002
$Race Mode Laps (set 3)
0x803D0179:byte:0x00000003
$Race Mode Laps (set 4)
0x803D0179:byte:0x00000004
$Race Mode Laps (set 5)
0x803D0179:byte:0x00000005
$Handicap On
0x803D132E:byte:0x00000001
$Handicap Off
0x803D132E:byte:0x00000000
$Disable Motor Setup (Rev. D)
0x8024E034:dword:0x80180D5C
0x8024E038:dword:0x80180BC0
$Disable Motor Setup (Rev. E)
0x8024E4B4:dword:0x801812E8
0x8024E4B8:dword:0x8018114C
[OnFrame_Enabled]
$Disable Motor Setup (Rev. D)
$Disable Motor Setup (Rev. E)""")

    #Virtual Soccer 4 2006
    if not os.path.exists(cfg_vs42006):
        with open(cfg_vs42006, "w") as script:
            script.write("""[Gecko]
$Boot Bypass
040568D8 60000000
[Gecko_Enabled]
$Boot Bypass""")

    #Mario Kart Arcade GP
    if not os.path.exists(cfg_mkagp):
        with open(cfg_mkagp, "w") as script:
            script.write("""[OnFrame_Enabled]
$Disable NAMCAM
$Loop Fix
$SkipBoot
[OnFrame]
$Disable NAMCAM
0x800790A0:dword:0x98650025
$Loop Fix
0x8003226C:dword:0x60000000
0x80032278:dword:0x41820158
$SkipBoot
0x80031BF0:dword:0x60000000
0x80031BFC:dword:0x60000000
0x800BE10C:dword:0x4800002C
0x8009F1E0:dword:0x6000000
[Gecko]
$Slowdowns Fix
041b2238 60000000
$Link Check Skip
04032410 60000000
$Skip boot checks
040320fc 60000000
[Gecko_Enabled]
$Slowdowns Fix
$Link Check Skip
$Skip boot checks""")

    #Mario Kart Arcade GP2
    if not os.path.exists(cfg_mkagp2):
        with open(cfg_mkagp2, "w") as script:
            script.write("""[OnFrame_Enabled]
$GameTestMode Patch
$SeatLoopPatch
[OnFrame]
$GameTestMode Patch
0x8002E340:dword:0x60000000
0x8002E34C:dword:0x60000000
$SeatLoopPatch
0x80084FC4:dword:0x4800000C
0x80085000:dword:0x60000000
[Gecko]
$Slowdowns Fix (US)
04086150 60000000
$Link Check Skip (US)
0402eb6c 60000000
$Skip boot checks (US)
0402e858 60000000
$Slowdowns Fix (JPN)
04086768 60000000
$Link Check Skip (JPN)
0402ebcc 60000000
$Skip boot checks (JPN)
0402e8b8 60000000
[Gecko_Enabled]
$Slowdowns Fix  (US)
$Link Check Skip (US)
$Skip boot checks (US)
$Slowdowns Fix  (JPN)
$Link Check Skip (JPN)
$Skip boot checks (JPN)""")
