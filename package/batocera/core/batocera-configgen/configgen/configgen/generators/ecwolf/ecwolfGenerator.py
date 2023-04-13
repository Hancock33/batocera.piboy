#!/usr/bin/env python

import Command
import batoceraFiles
from generators.Generator import Generator
import controllersConfig
import os
import shutil
from os import path
import codecs

ecwolfSrcDir = "/userdata/system/.config/ecwolf"
ecwolfConfig = batoceraFiles.CONF + "/ecwolf"
ecwolfConfigSrc = "/userdata/system/.config/ecwolf/ecwolf.cfg"
ecwolfConfigDest = batoceraFiles.CONF + "/ecwolf/ecwolf.cfg"
ecwolfSaves = batoceraFiles.SAVES + "/ecwolf"

class ECWolfGenerator(Generator):

    def generate(self, system, rom, playersControllers, guns, gameResolution):
        # Create config folders
        if not path.isdir(ecwolfConfig):
            os.mkdir(ecwolfConfig)
        if not path.isdir(ecwolfSrcDir):
            os.mkdir(ecwolfSrcDir)

        # Create config file if not there
        if not path.isfile(ecwolfConfigSrc):
            f = codecs.open(ecwolfConfigSrc, "x")
            f.write('Vid_FullScreen = 1;\n')
            f.write('Vid_Aspect = 0;\n')
            f.write('Vid_Vsync = 1;\n')
            f.write('FullScreenWidth = {};\n'.format(gameResolution["width"]))
            f.write('FullScreenHeight = {};\n'.format(gameResolution["height"]))
            f.close()

        # Symbolic link the cfg file
        if not path.exists(ecwolfConfigDest):
            shutil.copy(ecwolfConfigSrc, ecwolfConfigDest)

        # Set the resolution
        if path.isfile(ecwolfConfigDest):
            f = codecs.open(ecwolfConfigDest, "w")
            f.write('Vid_FullScreen = 1;\n')
            f.write('Vid_Aspect = 0;\n')
            f.write('Vid_Vsync = 1;\n')
            f.write('FullScreenWidth = {};\n'.format(gameResolution["width"]))
            f.write('FullScreenHeight = {};\n'.format(gameResolution["height"]))
            f.close()

        # Create save folder
        if not path.isdir(ecwolfSaves):
            os.mkdir(ecwolfSaves)

        # Inital command
        commandArray = ["ecwolf", "--savedir '/userdata/saves/ecwolf'"]

        try:
            if rom.endswith(".pk3"):
                commandArray.extend(["--file", os.path.basename(rom)])
                os.chdir(os.path.dirname(rom))
            else:
                os.chdir(os.path.dirname(rom))
        # Only game directories, not .zip
        except Exception as e:
            print("Error: couldn't go into directory {} ({})".format(rom, e))

        if os.path.isfile('/tmp/piboy') and not os.path.isfile('/tmp/piboy_xrs'):
            os.system('piboy_keys ecwolf.keys')
            return Command.Command(
                array=commandArray,
                env={
                'SDL_AUTO_UPDATE_JOYSTICKS': '0',
                'SDL_MOUSE_RELATIVE_SPEED_SCALE': '2.0'
            })
        else:
            return Command.Command(
                array=commandArray,
                env={
                "SDL_GAMECONTROLLERCONFIG": controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })