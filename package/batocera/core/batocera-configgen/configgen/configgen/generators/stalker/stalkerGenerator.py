from __future__ import annotations

from typing import TYPE_CHECKING
import os
from pathlib import Path

from ... import Command
from ...batoceraPaths import mkdir_if_not_exists
from ...controller import generate_sdl_game_controller_config
from ..Generator import Generator

base_dir = "/userdata/system/.local/share/GSC Game World"
cop_dir = base_dir + "/S.T.A.L.K.E.R. - Call of Pripyat"
cs_dir = base_dir + "/S.T.A.L.K.E.R. - Clear Sky"
cop_romdir = "/userdata/roms/ports/stalker/cop"
cs_romdir = "/userdata/roms/ports/stalker/cop"
assests = ['levels', 'localization', 'mp', 'patches', 'resources']

class StalkerGenerator(Generator):
    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        mkdir_if_not_exists(Path(base_dir))
        mkdir_if_not_exists(Path(cop_dir))
        mkdir_if_not_exists(Path(cs_dir))

        commandArray = ["xr_3da"]

        # Skip Intro
        if system.isOptSet('stalker_intro') and system.getOptBoolean('stalker_intro'):
            commandArray.extend(['-nointro'])

        # Call of Clear Sky
        if (rom.lower()).endswith('cs'):
            for asset in assests:
                if not os.path.islink(cs_dir + '/' + asset):
                    os.symlink(cs_romdir + '/' + asset, cs_dir + '/' + asset)
            commandArray.extend(['-cs'])
        else:
        # Call of Pripyat
            for asset in assests:
                if not os.path.islink(cop_dir + '/' + asset):
                    os.symlink(cop_romdir + '/' + asset, cop_dir + '/' + asset)

        return Command.Command(
            array=commandArray,
            env={
                'SDL_GAMECONTROLLERCONFIG': generate_sdl_game_controller_config(playersControllers)
            })

    def getHotkeysContext(self):
        return {
            "name": "xr_3da",
            "keys": { "exit": ["KEY_LEFTALT", "KEY_F4"] }
        }
