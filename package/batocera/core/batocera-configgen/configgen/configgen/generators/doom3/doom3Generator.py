#!/usr/bin/env python
import os
import shutil
from os import path
import Command
from generators.Generator import Generator
import controllersConfig
import utils.videoMode as videoMode

class Doom3Generator(Generator):

    def generate(self, system, rom, playersControllers, guns, gameResolution):
        gameResolution = videoMode.getCurrentResolution()
        commandArray = ["dhewm3", "+set", "fs_basepath", "/userdata/roms/ports/doom3", "+set", "r_mode", "-1", "+set" , "r_fullscreen", "1", "+set", "r_customWidth", str(gameResolution["width"]), "+set", "r_customHeight",str(gameResolution["height"])]

        if (rom.lower()).endswith('demo'):
            commandArray.extend(['+set', 'fs_game_base', 'demo'])
        elif (rom.lower()).endswith('d3xp'):
            commandArray.extend(['+set', 'fs_game_base', 'd3xp'])

        return Command.Command(
            array=commandArray,
            env={
                "SDL_GAMECONTROLLERCONFIG": controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })
