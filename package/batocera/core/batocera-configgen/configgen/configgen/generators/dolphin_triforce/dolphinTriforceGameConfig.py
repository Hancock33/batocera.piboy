#!/usr/bin/env python
import Command
import batoceraFiles
from generators.Generator import Generator
import shutil
import os.path
from os import environ
import configparser

cfg_fzero = batoceraFiles.dolphinTriforceGameSettings + "/SBGG.ini"
cfg_fzero2 = batoceraFiles.dolphinTriforceGameSettings + "/SBHA.ini"
cfg_mkagp =batoceraFiles.dolphinTriforceGameSettings + "/SBKP.ini"
cfg_mkagp2 = batoceraFiles.dolphinTriforceGameSettings + "/SBNL.ini"

def generateGameConfig():
    if not os.path.exists(batoceraFiles.dolphinTriforceGameSettings):
        os.makedirs(batoceraFiles.dolphinTriforceGameSettings)

    #F-Zero
    if not os.path.exists(cfg_fzero):
        with open(cfg_fzero, "w") as script:
            script.write("""[OnFrame]
$Disable Motor Setup (Rev. D)
0x8024E034:dword:0x80180D5C
0x8024E038:dword:0x80180BC0
$Disable Motor Setup (Rev. E)
0x8024E4B4:dword:0x801812E8
0x8024E4B8:dword:0x8018114C
[Core]
FPRF = True
CPUThread = True
[OnFrame_Disabled]
$Disable Motor Setup (Rev. D)
""")

    #F-Zero
    if not os.path.exists(cfg_fzero2):
        with open(cfg_fzero2, "w") as script:
            script.write("""[OnFrame]
$Disable Motor Setup
0x8023A0F4:dword:0x8016B4EC
0x8023A0F8:dword:0x8016B350
[Core]
FPRF = True
CPUThread = True
[OnFrame_Enabled]
$Disable Motor Setup
""")

    #Mario Kart Arcade GP
    if not os.path.exists(cfg_mkagp):
        with open(cfg_mkagp, "w") as script:
            script.write("""[OnFrame_Enabled]
$Loop fix2
 
[OnFrame]
$Loop fix2
0x80031BF0:dword:0x60000000
0x80031BFC:dword:0x60000000
0x800BE10C:dword:0x4800002C
0x8009F1E0:dword:0x60000000""")

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
0x80085000:dword:0x60000000""")