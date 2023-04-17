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

            #duckstation_rewind
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

            #gfxbackend
            if system.isOptSet("gfxbackend") and system.config["gfxbackend"] == 'Vulkan':
                psxconfig.set("GPU", "Renderer", "Vulkan")
            elif system.isOptSet("gfxbackend") and system.config["gfxbackend"] == 'Software':
                psxconfig.set("GPU", "Renderer", "Software")
            else:
                psxconfig.set("GPU", "Renderer", "OpenGL")

            # Write Ini File
            with open(psxConfigFile, 'w') as configfile:
                psxconfig.write(configfile, False)

        commandArray = ["/usr/duckstation/bin/duckstation-nogui", rom ]

        return Command.Command(
            array=commandArray,
            env={
            "XDG_CONFIG_HOME": batoceraFiles.CONF,
            "SDL_GAMECONTROLLERCONFIG": controllersConfig.generateSdlGameControllerConfig(playersControllers),
            "SDL_PADSORDERCONFIG": controllersConfig.generateSdlGameControllerPadsOrderConfig(playersControllers)
        })

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
