#!/usr/bin/env python
import batoceraFiles
import Command
from configparser import ConfigParser
import controllersConfig
from generators.Generator import Generator
import os
from os import path
from utils.buildargs import parse_args

class Eduke32Generator(Generator):

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        os.chdir("/userdata/roms/ports/eduke32")

        rtsfile = rom.replace('.GRP', '.RTS').replace('.grp', '.rts').replace('.EDUKE', '.RTS').replace('.eduke', '.rts')
        if (rom.lower()).endswith('eduke'):
            edukegroup=open(rom).readline().rstrip()
            edukerom=rom.replace('.eduke', '.GRP').replace('.EDUKE', '.GRP')

            commandArray = ["eduke32", edukerom, "-game_dir", os.path.dirname(os.path.abspath(rom)), "-g", edukegroup, "-rts", rtsfile]
        else:
            commandArray = ["eduke32", rom, "-game_dir", os.path.dirname(os.path.abspath(rom)), "-rts", rtsfile]

        if system.isOptSet("nologo") == False:
            commandArray.extend(["-nologo"])

        if os.path.isfile('/tmp/piboy') and not os.path.isfile('/tmp/piboy_xrs'):
            os.system('piboy_keys eduke32.keys')
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
