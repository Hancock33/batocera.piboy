from __future__ import annotations

import os

from typing import TYPE_CHECKING

from ... import Command
from ...controller import generate_sdl_game_controller_config
from ..Generator import Generator

if TYPE_CHECKING:
    from ...types import HotkeysContext

class NbloodGenerator(Generator):

    def getHotkeysContext(self) -> HotkeysContext:
        return {
            "name": "nblood",
            "keys": { "exit": ["KEY_LEFTALT", "KEY_Q"] }
        }

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        commandArray = ["nblood", "-j=" + os.path.dirname(os.path.abspath(rom))]

        return Command.Command(
            array=commandArray,
            env={
                'SDL_JOYSTICK_HIDAPI': '0', \
                'SDL_GAMECONTROLLERCONFIG': generate_sdl_game_controller_config(playersControllers)
            })
