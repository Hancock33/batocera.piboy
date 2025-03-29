from __future__ import annotations

from typing import TYPE_CHECKING

import os
from ... import Command
from ...controller import generate_sdl_game_controller_config
from ..Generator import Generator

if TYPE_CHECKING:
    from ...types import HotkeysContext

class AlephoneGenerator(Generator):

    def generate(self, system, rom, playersControllers, metadata, esmetadata, guns, wheels, gameResolution):
        game = "/userdata/roms/ports/alephone/marathon"
        if "marathon2" in rom.name:
            game = "/userdata/roms/ports/alephone/marathon2"

        if "infinity" in rom.name:
            game = "/userdata/roms/ports/alephone/infinity"

        commandArray = ["alephone", game]

        return Command.Command(
            array=commandArray,
            env={
                'SDL_GAMECONTROLLERCONFIG': generate_sdl_game_controller_config(playersControllers)
            })

    def getHotkeysContext(self) -> HotkeysContext:
        return {
            "name": "alephone",
            "keys": { "exit": ["KEY_LEFTALT", "KEY_F4"] }
        }
