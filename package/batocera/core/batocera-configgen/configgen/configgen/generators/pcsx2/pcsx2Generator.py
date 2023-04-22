#!/usr/bin/env python

from generators.Generator import Generator
import batoceraFiles
import Command
import os
from settings.unixSettings import UnixSettings
import re
import configparser
import os
import shutil
from os import path
import controllersConfig
from utils.logger import get_logger
import psutil

eslog = get_logger(__name__)

class Pcsx2Generator(Generator):

    def generate(self, system, rom, playersControllers, guns, gameResolution):
        ######## Ini file section ########
        pcsx2ConfigFile = "/userdata/system/configs/PCSX2/inis/PCSX2.ini"

        pscx2config = configparser.RawConfigParser(strict=False)
        pscx2config.optionxform=str     # Add Case Sensitive comportement

        if os.path.exists(pcsx2ConfigFile):
            pscx2config.read(pcsx2ConfigFile)

            # Aspect Ratio
            if system.isOptSet('ratio'):
                if system.config['ratio'] == '4/3':
                    pscx2config.set('EmuCore/GS', 'AspectRatio', '4:3')
                elif system.config['ratio'] == '16/9':
                    pscx2config.set('EmuCore/GS', 'AspectRatio', '16:9')
                elif system.config['ratio'] == 'full':
                    pscx2config.set('EmuCore/GS', 'AspectRatio', 'Auto 4:3/3:2')
            else:
                pscx2config.set('EmuCore/GS', 'AspectRatio', 'Auto 4:3/3:2')

            # Renderer
            if system.isOptSet('gfxbackend'):
                pscx2config.set('EmuCore/GS', 'Renderer', system.config["gfxbackend"])
            else:
                pscx2config.set('EmuCore/GS', 'Renderer', '-1')

            #Rending Resolution
            if system.isOptSet('internal_resolution'):
                pscx2config.set('EmuCore/GS', 'upscale_multiplier', system.config["internal_resolution"])
            else:
                pscx2config.set('EmuCore/GS', 'upscale_multiplier', '1')

            #Anistropic Filtering
            if system.isOptSet('anisotropic_filtering'):
                pscx2config.set('EmuCore/GS', 'MaxAnisotropy', system.config["anisotropic_filtering"])
            else:
                pscx2config.set('EmuCore/GS', 'MaxAnisotropy', '0')

            # Skipdraw Hack
            if system.isOptSet('skipdraw'):
                pscx2config.set('EmuCore/GS', 'UserHacks_SkipDraw_Start', system.config["skipdraw"])
            else:
                pscx2config.set('EmuCore/GS', 'UserHacks_SkipDraw_Start', '0')

            # Align sprite Hack
            if system.isOptSet('align_sprite'):
                pscx2config.set('EmuCore/GS', 'UserHacks_align_sprite_X', system.config["align_sprite"])
            else:
                pscx2config.set('EmuCore/GS', 'UserHacks_align_sprite_X', 'false')

            # Vsync
            if system.isOptSet('vsync'):
                pscx2config.set('EmuCore/GS', 'VsyncEnable', system.config["vsync"])
            else:
                pscx2config.set('EmuCore/GS', 'VsyncEnable', '1')

            # Vsyncs in MTGS Queue
            if system.isOptSet('VsyncQueueSize'):
                pscx2config.set("EmuCore/GS", "VsyncQueueSize", system.config['VsyncQueueSize'])
            else:
                pscx2config.set("EmuCore/GS", "VsyncQueueSize", "2")

            # Micro_Vu
            # Any speed hacks set explicitly or as defaults are considered safe by the PCSX2 devs
            # These hacks are also gentle on lower end systems with the exception of MTVU where we check system requirements
            pscx2config.set("EmuCore/Speedhacks", "IntcStat", "true")
            pscx2config.set("EmuCore/Speedhacks", "WaitLoop", "true")
            pscx2config.set("EmuCore/Speedhacks", "vu1Instant", "true")
            micro_vu_keys = {"vuFlagHack", "vuThread"}
            micro_vu_default_keys = {"vuFlagHack"}
            # MTVU + Instant VU1 is not supported by PCSX2; and so its one or the other
            if psutil.cpu_count(logical=False) >= 3:  # 3+ physical cores recommended by PCSX2 devs for MTVU
                micro_vu_default_keys.add("vuThread")
            else:
                micro_vu_default_keys.add("vu1Instant")

            micro_vu_enabled_keys = set(system.config["micro_vu"].split(",")) if system.isOptSet("micro_vu") else micro_vu_default_keys

            for key in micro_vu_enabled_keys:
                pscx2config.set("EmuCore/Speedhacks", key, "true")
            for key in micro_vu_keys - micro_vu_enabled_keys:
                pscx2config.set("EmuCore/Speedhacks", key, "false")

            # Enable Cheats
            if system.isOptSet('EmuCore_EnableCheats'):
                pscx2config.set("EmuCore", "EnableCheats", system.config["EmuCore_EnableCheats"])
            else:
                pscx2config.set("EmuCore", "EnableCheats", "false")

            # Enable Widescreen Patches
            if system.isOptSet('EmuCore_EnableWideScreenPatches'):
                pscx2config.set("EmuCore", "EnableWideScreenPatches", system.config["EmuCore_EnableWideScreenPatches"])
            else:
                pscx2config.set("EmuCore", "EnableWideScreenPatches", "false")

            # Automatic Gamefixes
            if system.isOptSet('EmuCore_EnablePatches'):
                pscx2config.set("EmuCore", "EnablePatches", system.config["EmuCore_EnablePatches"])
            else:
                pscx2config.set("EmuCore", "EnablePatches", "true")

            # Manual Gamefixes
            if system.isOptSet('EmuCore_ManualPatches') and system.config["EmuCore_ManualPatches"] != 'disabled':
                pscx2config.set("EmuCore/Gamefixes",system.config["EmuCore_ManualPatches"], "true")
            else:
                pscx2config.set("EmuCore/Gamefixes","VuAddSubHack",           "false")
                pscx2config.set("EmuCore/Gamefixes","FpuCompareHack",         "false")
                pscx2config.set("EmuCore/Gamefixes","FpuMulHack",             "false")
                pscx2config.set("EmuCore/Gamefixes","FpuNegDivHack",          "false")
                pscx2config.set("EmuCore/Gamefixes","XgKickHack",             "false")
                pscx2config.set("EmuCore/Gamefixes","IPUWaitHack",            "false")
                pscx2config.set("EmuCore/Gamefixes","EETimingHack",           "false")
                pscx2config.set("EmuCore/Gamefixes","SkipMPEGHack",           "false")
                pscx2config.set("EmuCore/Gamefixes","OPHFlagHack",            "false")
                pscx2config.set("EmuCore/Gamefixes","DMABusyHack",            "false")
                pscx2config.set("EmuCore/Gamefixes","VIFFIFOHack",            "false")
                pscx2config.set("EmuCore/Gamefixes","VIF1StallHack",          "false")
                pscx2config.set("EmuCore/Gamefixes","GIFFIFOHack",            "false")
                pscx2config.set("EmuCore/Gamefixes","GoemonTlbHack",          "false")
                pscx2config.set("EmuCore/Gamefixes","ScarfaceIbit",           "false")
                pscx2config.set("EmuCore/Gamefixes","CrashTagTeamRacingIbit", "false")
                pscx2config.set("EmuCore/Gamefixes","VU0KickstartHack",       "false")

            # Automatic Graphics Hardware Hacks
            if system.isOptSet('ManualHWHacks'):
                pscx2config.set("EmuCore/GS", "UserHacks", system.config["ManualHWHacks"])
            else:
                pscx2config.set("EmuCore/GS", "UserHacks", "true")

            # Enable Multitap
            if system.isOptSet('multitap') and system.config['multitap'] != 'disabled':
                if system.config['multitap'] == 'port1':
                    pscx2config.set("Pad","MultitapPort1", "true")
                    pscx2config.set("Pad","MultitapPort2", "false")
                elif system.config['multitap'] == 'port2':
                    pscx2config.set("Pad","MultitapPort1", "false")
                    pscx2config.set("Pad","MultitapPort2", "true")
                elif system.config['multitap'] == 'port12':
                    pscx2config.set("Pad","MultitapPort1", "true")
                    pscx2config.set("Pad","MultitapPort2", "true")
            else:
                pscx2config.set("Pad", "MultitapPort1", "false")
                pscx2config.set("Pad", "MultitapPort2", "false")

            # Write Ini File
            with open(pcsx2ConfigFile, 'w') as configfile:
                pscx2config.write(configfile, False)

        ######## Command line section ########
        if system.isOptSet('avx2'):
            if system.config['avx2'] == '1':
                commandArray = ["/usr/pcsx2-avx2/bin/pcsx2", rom]
            elif system.config['avx2'] == '0':
                commandArray = ["/usr/pcsx2/bin/pcsx2", rom]
        else:
            commandArray = ["/usr/pcsx2/bin/pcsx2", rom]

        # Fullscreen
        commandArray.append("-fullscreen")
        commandArray.append("-nogui")

        # Fullboot
        if system.isOptSet('fullboot') and system.config['fullboot'] == '0':
            commandArray.append("-fastboot")
            eslog.debug("Fast Boot and skip BIOS")
        else:
            commandArray.append("-slowboot")

        return Command.Command(
            array=commandArray,
            env={
            "XDG_CONFIG_HOME": batoceraFiles.CONF,
            "SDL_GAMECONTROLLERCONFIG": controllersConfig.generateSdlGameControllerConfig(playersControllers),
            "SDL_PADSORDERCONFIG": controllersConfig.generateSdlGameControllerPadsOrderConfig(playersControllers)
        })
