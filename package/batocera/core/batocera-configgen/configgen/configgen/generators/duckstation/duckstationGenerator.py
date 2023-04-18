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
from os import environ

eslog = get_logger(__name__)

class DuckstationGenerator(Generator):
    def generate(self, system, rom, playersControllers, guns, gameResolution):
        # Test if it's a m3u file
        if os.path.splitext(rom)[1] == ".m3u":
            rom = rewriteM3uFullPath(rom)
        ######## Ini file section ########
        psxConfigFile = "/userdata/system/configs/duckstation/settings.ini"

        psxconfig = configparser.RawConfigParser(strict=False)
        psxconfig.optionxform=str     # Add Case Sensitive comportement

        if os.path.exists(psxConfigFile):
            psxconfig.read(psxConfigFile)

            # Aspect Ratio
            psxconfig.set("Display", "AspectRatio", getGfxRatioFromConfig(system.config, gameResolution))

            # duckstation_rewind
            psxconfig.set("Main","RewindEnable",    "true")
            psxconfig.set("Main","RewindFrequency", "1")        # Frame skipped each seconds
            if system.isOptSet("duckstation_rewind") and system.config["duckstation_rewind"]   == '120':
                psxconfig.set("Main","RewindSaveSlots", "120")  # Total duration available in sec
            elif system.isOptSet("duckstation_rewind") and system.config["duckstation_rewind"] == '90':
                psxconfig.set("Main","RewindSaveSlots", "90")
            elif system.isOptSet("duckstation_rewind") and system.config["duckstation_rewind"] == '60':
                psxconfig.set("Main","RewindSaveSlots", "60")
            elif system.isOptSet("duckstation_rewind") and system.config["duckstation_rewind"] == '30':
                psxconfig.set("Main","RewindSaveSlots", "30")
            elif system.isOptSet("duckstation_rewind") and system.config["duckstation_rewind"] == '15':
                psxconfig.set("Main","RewindSaveSlots", "15")
            elif system.isOptSet("duckstation_rewind") and system.config["duckstation_rewind"] == '10':
                psxconfig.set("Main","RewindSaveSlots", "100")
                psxconfig.set("Main","RewindFrequency", "0.100000")
            elif system.isOptSet("duckstation_rewind") and system.config["duckstation_rewind"] == '5':
                psxconfig.set("Main","RewindSaveSlots", "50")
                psxconfig.set("Main","RewindFrequency", "0.050000")
            else:
                psxconfig.set("Main","RewindEnable", "false")

            # gfxbackend
            if system.isOptSet("gfxbackend") and system.config["gfxbackend"] == 'Vulkan':
                psxconfig.set("GPU", "Renderer", "Vulkan")
            elif system.isOptSet("gfxbackend") and system.config["gfxbackend"] == 'Software':
                psxconfig.set("GPU", "Renderer", "Software")
            else:
                psxconfig.set("GPU", "Renderer", "OpenGL")

            # duckstation_osd
            if system.isOptSet("duckstation_osd"):
                psxconfig.set("Display", "ShowOSDMessages", system.config["duckstation_osd"])
            else:
                psxconfig.set("Display", "ShowOSDMessages", "false")

            # duckstation_executionmode
            if system.isOptSet("duckstation_executionmode") and system.config["duckstation_executionmode"] != 'Recompiler':
                psxconfig.set("CPU", "ExecutionMode", system.config["duckstation_executionmode"])
            else:
                psxconfig.set("CPU", "ExecutionMode", "Recompiler")

            # duckstation_threadedpresentation
            if system.isOptSet("duckstation_threadedpresentation") and system.config["duckstation_threadedpresentation"] != '0':
                psxconfig.set("GPU", "ThreadedPresentation", "true")
            else:
                psxconfig.set("GPU", "ThreadedPresentation", "false")

            # duckstation_vsync
            if system.isOptSet("duckstation_vsync") and system.config["duckstation_vsync"] != '1':
                psxconfig.set("Display", "Vsync", "false")
            else:
                psxconfig.set("Display", "Vsync", "true")

            # duckstation_frameskip
            if system.isOptSet('duckstation_frameskip') and system.config["duckstation_frameskip"] != '0':
                psxconfig.set("Display", "DisplayAllFrames", "true")
            else:
                psxconfig.set("Display", "DisplayAllFrames", "false")

            # duckstation_PatchFastBoot
            if system.isOptSet("duckstation_PatchFastBoot") and system.config["duckstation_PatchFastBoot"] != '0':
                psxconfig.set("BIOS", "PatchFastBoot", "true")
            else:
                psxconfig.set("BIOS", "PatchFastBoot", "false")

            # duckstation_resolution_scale
            if system.isOptSet("duckstation_resolution_scale") and system.config["duckstation_resolution_scale"] != '1':
                psxconfig.set("GPU", "ResolutionScale", system.config["duckstation_resolution_scale"])
            else:
                psxconfig.set("GPU", "ResolutionScale", "1")

            # duckstation_antialiasing
            if system.isOptSet("duckstation_antialiasing") and system.config["duckstation_antialiasing"] != '1':
                tab = system.config["duckstation_antialiasing"].split('-')
                psxconfig.set("GPU", "Multisamples", tab[0])
                if len(tab) > 1:
                    psxconfig.set("GPU", "PerSampleShading", "true")
            else:
                psxconfig.set("GPU", "Multisamples", "1")

            # duckstation_texture_filtering
            if system.isOptSet("duckstation_texture_filtering") and system.config["duckstation_texture_filtering"] != 'Nearest':
               psxconfig.set("GPU", "TextureFilter", system.config["duckstation_texture_filtering"])
            else:
               psxconfig.set("GPU", "TextureFilter", "Nearest")

            # duckstation_CropMode
            if system.isOptSet("duckstation_CropMode") and system.config["duckstation_CropMode"] != 'None':
               psxconfig.set("Display", "CropMode", system.config["duckstation_CropMode"])
            else:
                psxconfig.set("Display", "CropMode", "Overscan")

            # duckstation_widescreen_hack
            if system.isOptSet('duckstation_widescreen_hack') and system.config["duckstation_widescreen_hack"] != '0' and system.config["ratio"] == "16/9": # and system.config["bezel"] == "none"::
                psxconfig.set("GPU", "WidescreenHack", "true")
            else:
                psxconfig.set("GPU", "WidescreenHack", "false")

            # duckstation_region
            if system.isOptSet("duckstation_region") and system.config["duckstation_region"] == 'PAL':
                psxconfig.set("Console", "Region", "PAL")
            elif system.isOptSet("duckstation_region") and system.config["duckstation_region"] == 'NTSC-J':
                psxconfig.set("Console", "Region", "NTSC-J")
            elif system.isOptSet("duckstation_region") and system.config["duckstation_region"] == 'NTSC-U':
                psxconfig.set("Console", "Region", "NTSC-U")
            else:
                psxconfig.set("Console", "Region", "Auto")

            # duckstation_60hz
            if system.isOptSet("duckstation_60hz") and system.config["duckstation_60hz"] == '1':
               psxconfig.set("GPU", "ForceNTSCTimings", "true")
            else:
               psxconfig.set("GPU", "ForceNTSCTimings", "false")

            # duckstation_custom_textures
            if system.isOptSet("duckstation_custom_textures") and system.config["duckstation_custom_textures"] == '0':
                psxconfig.set("TextureReplacements", "EnableVRAMWriteReplacements", "false")
                psxconfig.set("TextureReplacements", "PreloadTextures",  "false")
            elif system.isOptSet("duckstation_custom_textures") and system.config["duckstation_custom_textures"] == 'preload':
                psxconfig.set("TextureReplacements", "EnableVRAMWriteReplacements", "true")
                psxconfig.set("TextureReplacements", "PreloadTextures",  "true")
            else:
                psxconfig.set("TextureReplacements", "EnableVRAMWriteReplacements", "true")
                psxconfig.set("TextureReplacements", "PreloadTextures",  "false")

            # duckstation_rumble
            #if system.isOptSet("duckstation_rumble") and system.config["duckstation_rumble"] != '0':
            #    if system.isOptSet("duckstation_" + controller) and (system.config["duckstation_" + controller] in controllerRumbleList):
            #        psxconfig.set(controller, "Rumble", "Controller" + str(pad.index))
            #else:
            #    psxconfig.set(controller, "Rumble", "false")

            # Texture Replacement saves\textures\psx game id - by default in Normal
            if system.isOptSet("duckstation_custom_textures") and system.config["duckstation_custom_textures"] == '0':
                psxconfig.set("TextureReplacements", "EnableVRAMWriteReplacements", "false")
                psxconfig.set("TextureReplacements", "PreloadTextures",  "false")
            elif system.isOptSet("duckstation_custom_textures") and system.config["duckstation_custom_textures"] == 'preload':
                psxconfig.set("TextureReplacements", "EnableVRAMWriteReplacements", "true")
                psxconfig.set("TextureReplacements", "PreloadTextures",  "true")
            else:
                psxconfig.set("TextureReplacements", "EnableVRAMWriteReplacements", "true")
                psxconfig.set("TextureReplacements", "PreloadTextures",  "false")

            # duckstation_digitalmode
            #if system.isOptSet("duckstation_digitalmode") and system.config["duckstation_digitalmode"] == '0':
            #    psxconfig.set(controller, "AnalogDPadInDigitalMode", "false")
            #else:
            #    psxconfig.set(controller, "AnalogDPadInDigitalMode", "true")

            # duckstation_multitap
            if system.isOptSet("duckstation_multitap") and system.config["duckstation_multitap"] != 'Disabled':
                psxconfig.set("ControllerPorts", "MultitapMode", system.config["duckstation_multitap"])
            else:
                psxconfig.set("ControllerPorts", "MultitapMode", "Disabled")

            # duckstation_Controller1

            # duckstation_Controller2

            # duckstation_pgxp
            if system.isOptSet("duckstation_pgxp"):
               psxconfig.set("GPU", "PGXPEnable", system.config["duckstation_pgxp"])
               psxconfig.set("GPU", "PGXPCulling", system.config["duckstation_pgxp"])
               psxconfig.set("GPU", "PGXPTextureCorrection", system.config["duckstation_pgxp"])
               psxconfig.set("GPU", "PGXPPreserveProjFP", system.config["duckstation_pgxp"])
            else:
               psxconfig.set("GPU", "PGXPEnable", "true")
               psxconfig.set("GPU", "PGXPCulling", "true")
               psxconfig.set("GPU", "PGXPTextureCorrection", "true")
               psxconfig.set("GPU", "PGXPPreserveProjFP", "true")

            # Write Ini File
            with open(psxConfigFile, 'w') as configfile:
                psxconfig.write(configfile, False)

        commandArray = ["/usr/duckstation/bin/duckstation-nogui", rom ]

        # Fullscreen
        commandArray.append("-fullscreen")
        commandArray.append("-nogui")

        return Command.Command(
            array=commandArray,
            env={
            "XDG_CONFIG_HOME": batoceraFiles.CONF,
            "SDL_GAMECONTROLLERCONFIG": controllersConfig.generateSdlGameControllerConfig(playersControllers),
            "SDL_PADSORDERCONFIG": controllersConfig.generateSdlGameControllerPadsOrderConfig(playersControllers)
        })

def getGfxRatioFromConfig(config, gameResolution):
    #ratioIndexes = ["Auto (Game Native)", "Auto (Match Window)", "4:3", "16:9", "1:1", "1:1 PAR", "2:1 (VRAM 1:1)", "3:2", "5:4", "8:7", "16:10", "19:9", "20:9", "32:9"]
    # 2: 4:3 ; 1: 16:9  ; 0: auto
    if "ratio" in config:
        if config["ratio"] == "2/1":
            return "2:1 (VRAM 1:1)"
        elif config["ratio"] == "full":
            return "Auto (Match Window)"
        else:
            return config["ratio"].replace("/",":")

    if ("ratio" not in config or ("ratio" in config and config["ratio"] == "auto")) and gameResolution["width"] / float(gameResolution["height"]) >= (16.0 / 9.0) - 0.1: # let a marge
        return "16:9"

    return "4:3"

def getLangFromEnvironment():
    lang = environ['LANG'][:5]
    availableLanguages = { "en_US": "en",
                           "de_DE": "de",
                           "fr_FR": "fr",
                           "es_ES": "es",
                           "he_IL": "he",
                           "it_IT": "it",
                           "ja_JP": "ja",
                           "nl_NL": "nl",
                           "pl_PL": "pl",
                           "pt_BR": "pt-br",
                           "pt_PT": "pt-pt",
                           "ru_RU": "ru",
                           "zh_CN": "zh-cn"
    }

    if lang in availableLanguages:
        return availableLanguages[lang]
    return availableLanguages["en_US"]

def rewriteM3uFullPath(m3u):                                                                    # Rewrite a clean m3u file with valid fullpath
    # get initialm3u
    firstline = open(m3u).readline().rstrip()                                                   # Get first line in m3u
    initialfirstdisc = "/tmp/" + os.path.splitext(os.path.basename(firstline))[0] + ".m3u"      # Generating a temp path with the first iso filename in m3u

    # create a temp m3u to bypass Duckstation m3u bad pathfile
    fulldirname = os.path.dirname(m3u)
    readtempm3u = open(initialfirstdisc, "w")

    initialm3u = open(m3u, "r")
    with open(initialfirstdisc, 'a') as f1:
        for line in initialm3u:
            if line[0] == "/":                          # for /MGScd1.chd
                newpath = fulldirname + line
            else:
                newpath = fulldirname + "/" + line      # for MGScd1.chd
            f1.write(newpath)

    return initialfirstdisc                                                                      # Return the tempm3u pathfile written with valid fullpath
