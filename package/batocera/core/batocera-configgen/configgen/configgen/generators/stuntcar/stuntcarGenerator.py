from __future__ import annotations

import os
from typing import TYPE_CHECKING

from ... import Command
from ...controller import generate_sdl_game_controller_config
from ..Generator import Generator

if TYPE_CHECKING:
    from ...types import HotkeysContext

class StuntcarGenerator(Generator):

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        os.chdir("/usr/share/stuntcar")
        commandArray = ["/usr/share/stuntcar/stuntcar", "-f"]

        return Command.Command(
            array=commandArray,
            env={
                'SDL_GAMECONTROLLERCONFIG': generate_sdl_game_controller_config(playersControllers)
            })

    def getInGameRatio(self, config, gameResolution, rom):
        return 16/9

    def getHotkeysContext(self):
        return {
            "name": "stuntcar",
            "keys": { "exit": ["KEY_LEFTALT", "KEY_F4"] }
        }
