#!/usr/bin/env python
import os
from os import path
import Command
from generators.Generator import Generator
import controllersConfig

class IonfuryGenerator(Generator):

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        commandArray = ["ionfury", "-game_dir", os.path.dirname(os.path.abspath(rom)), "-g", rom]

        if system.isOptSet("nologo") == False:
            commandArray.extend(["-nologo"])

        os.chdir(os.path.dirname(os.path.abspath(rom)))

        if os.path.isfile('/tmp/piboy') and not os.path.isfile('/tmp/piboy_xrs'):
            os.system('piboy_keys ionfury.keys')
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
