#!/usr/bin/env python
import os
from os import path
import Command
from generators.Generator import Generator
import controllersConfig

class SerioussamGenerator(Generator):

    def generate(self, system, rom, playersControllers, guns, gameResolution):
        # Determine the emulator to use
        if "samtfe" in rom.lower():
            data_dir = '/usr/share/game_assets/samtfe/Bin'
        elif "samtse" in rom.lower():
            data_dir = '/usr/share/game_assets/samtse/Bin'
        else:
            data_dir = '/usr/share/game_assets/samtfe/Bin'

        os.chdir(data_dir)
        commandArray = [data_dir + '/SeriousSam']

        return Command.Command(
            array=commandArray,
            env={
                'LD_LIBRARY_PATH': '/usr/lib:/lib:' + data_dir,
                'SDL_GAMECONTROLLERCONFIG': controllersConfig.generateSdlGameControllerConfig(playersControllers)
        })
