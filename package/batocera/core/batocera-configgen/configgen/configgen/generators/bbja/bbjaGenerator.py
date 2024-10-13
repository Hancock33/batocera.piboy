from __future__ import annotations

from typing import TYPE_CHECKING

import os
from ... import Command, controllersConfig
from ..Generator import Generator

if TYPE_CHECKING:
    from ...types import HotkeysContext


class BbjaGenerator(Generator):

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        commandArray = ["bbja", "--datapath=/userdata/roms/ports/bbja", "--fullscreen"]

        return Command.Command(
            array=commandArray,
            env={
                "SDL_GAMECONTROLLERCONFIG": controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })

    def getHotkeysContext(self) -> HotkeysContext:
        return {
            "name": "bbja",
            "keys": { "exit": ["KEY_LEFTALT", "KEY_F4"] }
        }
