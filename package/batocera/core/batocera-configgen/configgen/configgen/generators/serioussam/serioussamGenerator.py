#!/usr/bin/env python
import os
from os import path
import Command
from generators.Generator import Generator
import controllersConfig

class SerioussamGenerator(Generator):

    def generate(self, system, rom, playersControllers, guns, gameResolution):
        # Determine the emulator to 
        sam_rom = rom.lower()
        data_dir = '/usr/share/game_assets/samtse/Bin'
        
        if (sam_rom.__contains__("/samtfe/")):
            data_dir = '/usr/share/game_assets/samtfe/Bin'
        elif (sam_rom.__contains__("/samtse/")):
            data_dir = '/usr/share/game_assets/samtse/Bin'

        os.chdir(data_dir)
        commandArray = [data_dir + '/serioussam']

        return Command.Command(
            array=commandArray,
            env={
                'LD_LIBRARY_PATH': '/usr/lib:/lib:' + data_dir,
                'SDL_GAMECONTROLLERCONFIG': controllersConfig.generateSdlGameControllerConfig(playersControllers)
        })
