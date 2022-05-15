#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig


class DoomretroGenerator(Generator):

    def generate(self, system, rom, playersControllers, gameResolution):
        commandArray = ["doomretro"]
        
        if (rom.__contains__(".uwad")):
            f=open(rom)
            content=f.readlines()
            for line in content:
                if 'IWAD=/' in line:
                    commandArray.append("-iwad")
                    commandArray.append(line.replace("IWAD=", "").replace("\n", ""))
                elif 'PWAD=/' in line:
                    commandArray.append("-file")
                    commandArray.append(line.replace("PWAD=", "").replace("\n", ""))

        else:
            commandArray.append("-iwad")
            commandArray.append(rom)

        return Command.Command(
            array=commandArray,
            env={
                'SDL_GAMECONTROLLERCONFIG': controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })
