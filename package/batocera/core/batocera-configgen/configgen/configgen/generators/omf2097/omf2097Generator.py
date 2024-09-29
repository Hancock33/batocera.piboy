import os
import shutil
from os import path

from ... import Command
from ... import batoceraFiles
from ... import controllersConfig
from ..Generator import Generator

omf_src = "/usr/share/game_assets/omf2097"
omf_dst = "/userdata/roms/ports/omf2097"

class Omf2097Generator(Generator):

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        commandArray = ["openomf"]

        shutil.copytree(omf_src, omf_dst, dirs_exist_ok=True)

        return Command.Command(
            array=commandArray,
            env={
                'OPENOMF_RESOURCE_DIR' : '/userdata/roms/ports/omf2097',
                'SDL_AUTO_UPDATE_JOYSTICKS': '0'
            })
