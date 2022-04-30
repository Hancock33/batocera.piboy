#!/usr/bin/env python
import os
from os import path
import Command
from generators.Generator import Generator
import controllersConfig

class IonfuryGenerator(Generator):

    def generate(self, system, rom, playersControllers, gameResolution):
        commandArray = ["ionfury", "-game_dir", os.path.dirname(os.path.abspath(rom)), "-g", rom]
        os.chdir(os.path.dirname(os.path.abspath(rom)))

        return Command.Command(
            array=commandArray,
            env={
                'SDL_AUTO_UPDATE_JOYSTICKS': '0'
            })
