#!/usr/bin/env python

import Command
import batoceraFiles
from generators.Generator import Generator
import controllersConfig
import os
from os import path

ecwolfConfig  = batoceraFiles.CONF + "/ecwolf"
ecwolfSaves   = batoceraFiles.SAVES + "/ecwolf"

class ECWolfGenerator(Generator):

    def generate(self, system, rom, playersControllers, gameResolution):
        # Create config folder
        if not path.isdir(ecwolfConfig):
            os.mkdir(ecwolfConfig)

        # Create save folder
        if not path.isdir(ecwolfSaves):
            os.mkdir(ecwolfSaves)

        try:
            os.chdir(os.path.dirname(rom))
        # Only game directories, not .zip
        except Exception as e:
            print("Error: couldn't go into directory {} ({})".format(rom, e))
        commandArray = ["ecwolf", "--fullscreen", "--joystick", "-1", "--savedir /userdata/saves/ecwolf", "--config /userdata/system/configs/ecwolf/ecwolf.cfg"]

        return Command.Command(
            array=commandArray,
            env={
                'SDL_AUTO_UPDATE_JOYSTICKS': '0',
                'SDL_MOUSE_RELATIVE_SPEED_SCALE': '2.0'
            })