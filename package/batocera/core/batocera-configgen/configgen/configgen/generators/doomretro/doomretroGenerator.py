#!/usr/bin/env python
import batoceraFiles
import Command
import controllersConfig
from generators.Generator import Generator
import os
from os import path
import shlex

class DoomretroGenerator(Generator):
    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):

        iwad = ''
        pwad = ''

        if rom.endswith(".uwad"):
            f=open(rom)
            content=f.readlines()
            for line in content:
                if 'IWAD=/' in line:
                    iwad += line.replace('IWAD=', '').replace('\n', ' ')
                elif 'PWAD=/' in line:
                    pwad += line.replace('PWAD=', '').replace('\n', ' ')
            iwad_command = '-iwad ' + iwad + '-file ' + pwad
            args = shlex.split(iwad_command)
        else:
            iwad_command = '-iwad ' + rom
            args = shlex.split(iwad_command)

        commandArray = ['doomretro', *args]

        return Command.Command(
            array=commandArray,
            env={
            'DOOMWADDIR': '/userdata/roms/ports/doom',
            'SDL_GAMECONTROLLERCONFIG': controllersConfig.generateSdlGameControllerConfig(playersControllers)
        })
