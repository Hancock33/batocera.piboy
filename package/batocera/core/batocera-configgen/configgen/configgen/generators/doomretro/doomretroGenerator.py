#!/usr/bin/env python
import os
from os import path
import Command
from generators.Generator import Generator
import controllersConfig

class DoomretroGenerator(Generator):
    def generate(self, system, rom, playersControllers, guns, gameResolution):
        commandArray = ['doomretro']

        if (rom.__contains__('.uwad')):
            f=open(rom)
            content=f.readlines()
            for line in content:
                if 'IWAD=/' in line:
                    commandArray.extend(['-iwad', line.replace('IWAD=', '').replace('\n', '')])
                elif 'PWAD=/' in line:
                    commandArray.extend(['-file', line.replace('PWAD=', '').replace('\n', '')])
        else:
                    commandArray.extend(['-iwad', rom])


        return Command.Command(
            array=commandArray,
            env={
            'DOOMWADDIR': '/userdata/roms/ports/doom',
            'SDL_GAMECONTROLLERCONFIG': controllersConfig.generateSdlGameControllerConfig(playersControllers)
        })