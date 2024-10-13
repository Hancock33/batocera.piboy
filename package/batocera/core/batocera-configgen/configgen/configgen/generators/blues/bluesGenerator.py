from __future__ import annotations

from typing import TYPE_CHECKING

import os
from ... import Command, controllersConfig
from ..Generator import Generator

if TYPE_CHECKING:
    from ...types import HotkeysContext

class BluesGenerator(Generator):

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        commandArray = ["blues", "--datapath=/userdata/roms/ports/blues", "--fullscreen"]

        return Command.Command(
            array=commandArray,
            env={
                "SDL_GAMECONTROLLERCONFIG": controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })

    def getHotkeysContext(self) -> HotkeysContext:
        return {
            "name": "blues",
            "keys": { "exit": ["KEY_LEFTALT", "KEY_F4"] }
        }
