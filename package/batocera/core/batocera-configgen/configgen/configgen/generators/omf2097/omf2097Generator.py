#!/usr/bin/env python
import os
import shutil
from os import path
import Command
from generators.Generator import Generator
import controllersConfig

omf_src = "/usr/share/game_assets/omf2097"
omf_dst = "/userdata/roms/ports/omf2097"

class Omf2097Generator(Generator):

    def def generate(self, system, rom, playersControllers, guns, wheels, gameResolution):
        commandArray = ["openomf"]

        shutil.copytree(omf_src, omf_dst, dirs_exist_ok=True)

        return Command.Command(
            array=commandArray,
            env={
                'OPENOMF_RESOURCE_DIR' : '/userdata/roms/ports/omf2097',
                'SDL_AUTO_UPDATE_JOYSTICKS': '0'
            })
