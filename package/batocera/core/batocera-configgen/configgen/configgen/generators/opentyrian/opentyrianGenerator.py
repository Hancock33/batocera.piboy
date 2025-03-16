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

class OpentyrianGenerator(Generator):

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        if  "2000" in rom.name:
            commandArray = ["opentyrian2000", "-t" "/usr/share/tyrian2000/", "-j"]
        else:
            commandArray = ["opentyrian", "-t" "/usr/share/opentyrian/data/", "-j"]

        return Command.Command(
            array=commandArray,
            env={
                'SDL_GAMECONTROLLERCONFIG': generate_sdl_game_controller_config(playersControllers)
            })

    def getInGameRatio(self, config, gameResolution, rom):
        return 16/9

    def getHotkeysContext(self) -> HotkeysContext:
        return {
            "name": "opentyrian",
            "keys": { "exit": ["KEY_LEFTALT", "KEY_F4"] }
        }
