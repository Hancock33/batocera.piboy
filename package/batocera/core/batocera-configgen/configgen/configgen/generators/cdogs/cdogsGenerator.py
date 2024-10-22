from __future__ import annotations

import logging
import os
from typing import TYPE_CHECKING

from ... import Command
from ...batoceraPaths import ROMS
from ...controller import generate_sdl_game_controller_config
from ..Generator import Generator

if TYPE_CHECKING:
    from ...types import HotkeysContext


eslog = logging.getLogger(__name__)

class CdogsGenerator(Generator):

    def getHotkeysContext(self) -> HotkeysContext:
        return {
            "name": "cdogs",
            "keys": { "exit": ["KEY_LEFTALT", "KEY_F4"], "menu": "KEY_ESC", "pause": "KEY_ESC" }
        }

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        commandArray = ["cdogs", "--fullscreen"]

        return Command.Command(
            array=commandArray,
            env={
                'SDL_GAMECONTROLLERCONFIG': generate_sdl_game_controller_config(playersControllers)
            })
