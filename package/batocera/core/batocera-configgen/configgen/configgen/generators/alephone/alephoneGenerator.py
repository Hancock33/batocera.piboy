from __future__ import annotations

from typing import TYPE_CHECKING

import os
from ... import Command, controllersConfig
from ..Generator import Generator

if TYPE_CHECKING:
    from ...types import HotkeysContext

class AlephoneGenerator(Generator):

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        game = "/userdata/roms/ports/alephone/marathon"
        if (rom.__contains__("marathon2")):
            game = "/userdata/roms/ports/alephone/marathon2"

        if (rom.__contains__("infinity")):
            game = "/userdata/roms/ports/alephone/infinity"

        commandArray = ["alephone", game]

        return Command.Command(
            array=commandArray,
            env={
                "SDL_GAMECONTROLLERCONFIG": controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })

    def getHotkeysContext(self) -> HotkeysContext:
        return {
            "name": "alephone",
            "keys": { "exit": ["KEY_LEFTALT", "KEY_F4"] }
        }
