from __future__ import annotations

import os
import shutil
from typing import TYPE_CHECKING

from ... import Command
from ...controller import generate_sdl_game_controller_config
from ..Generator import Generator
import pathlib

if TYPE_CHECKING:
    from ...types import HotkeysContext

class RaptorGenerator(Generator):
    if not pathlib.Path('/userdata/system/configs/raptor').exists():
        pathlib.Path('/userdata/system/configs/raptor').mkdir(parents=True)

    if not pathlib.Path('/userdata/system/configs/raptor/SETUP.INI').is_file():
        shutil.copyfile('/usr/share/raptor/SETUP.INI', '/userdata/system/configs/raptor/SETUP.INI')

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        os.chdir("/userdata/roms/ports/raptor")
        commandArray = ["raptor"]

        return Command.Command(
            array=commandArray,
            env={
                'SDL_AUTO_UPDATE_JOYSTICKS': '0'
            })

    def getHotkeysContext(self) -> HotkeysContext:
        return {
            "name": "raptor",
            "keys": { "exit": ["KEY_LEFTALT", "KEY_F4"] }
        }
