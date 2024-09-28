import os.path

from ... import Command
from ... import batoceraFiles
from ..Generator import Generator

cfg_fzero = batoceraFiles.dolphinTriforceGameSettings + "/SBGG.ini"
cfg_vs42006 = batoceraFiles.dolphinTriforceGameSettings + "/SBLL.ini"
cfg_mkagp =batoceraFiles.dolphinTriforceGameSettings + "/SBKP.ini"
cfg_mkagp2 = batoceraFiles.dolphinTriforceGameSettings + "/SBNL.ini"
cfg_fzeromr = batoceraFiles.dolphinTriforceGameSettings + "/SBHA.ini"

def generateGameConfig():
    if not os.path.exists(batoceraFiles.dolphinTriforceGameSettings):
        os.makedirs(batoceraFiles.dolphinTriforceGameSettings)
    else:
        for f in os.listdir(batoceraFiles.dolphinTriforceGameSettings):
            os.remove(os.path.join(batoceraFiles.dolphinTriforceGameSettings, f))

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
0x8009F1E0:dword:0x60000000""")

    #Mario Kart Arcade GP2
    if not os.path.exists(cfg_mkagp2):
        with open(cfg_mkagp2, "w") as script:
            script.write("""[OnFrame_Enabled]
$DVDInquiry Patchok
$Disable CARD
$Disable CAM
$Seat Loop patch
$Stuck loop patch
$60times Loop patch
$GameTestMode Patch
$SeatLoopPatch
$99 credits
[OnFrame]
$DVDInquiry Patchok
0x80286388:dword:0x3C602100
0x8028638C:dword:0x4E800020
$Ignore CMD Encryption
0x80285CD0:dword:0x93A30008
0x80285CD4:dword:0x93C3000C
0x80285CD8:dword:0x93E30010
$Disable CARD
0x80073BF4:dword:0x98650023
0x80073C10:dword:0x98650023
$Disable CAM
0x80073BD8:dword:0x98650025
$Seat Loop patch
0x800BE10C:dword:0x4800002C
$Stuck loop patch
0x8002E100:dword:0x60000000
$60times Loop patch
0x8028B5D4:dword:0x60000000
$GameTestMode Patch
0x8002E340:dword:0x60000000
0x8002E34C:dword:0x60000000
$SeatLoopPatch
0x80084FC4:dword:0x4800000C
0x80085000:dword:0x60000000
$99 credits
0x80690AC0:dword:0x00000063""")

    #F-ZERO AX Monster Ride
    if not os.path.exists(cfg_fzeromr):
        with open(cfg_fzeromr, "w") as script:
            script.write("""[OnFrame]
$Disable Motor Setup
0x8023A0F4:dword:0x8016B4EC
0x8023A0F8:dword:0x8016B350
[Gecko]
$Bypass Cycraft
0043137B 00000086
$Slowdown Fix
0043137E 00000000
[Gecko_Enabled]
$Bypass Cycraft
$Slowdown Fix
[OnFrame_Enabled]
$Disable Motor Setup""")
