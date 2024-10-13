from __future__ import annotations

from typing import TYPE_CHECKING
import os
import shutil

from ... import Command, controllersConfig
from ..Generator import Generator

class RaptorGenerator(Generator):
    if not os.path.exists('/userdata/system/configs/raptor'):
        os.makedirs('/userdata/system/configs/raptor')

    if not os.path.isfile('/userdata/system/configs/raptor/SETUP.INI'):
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
