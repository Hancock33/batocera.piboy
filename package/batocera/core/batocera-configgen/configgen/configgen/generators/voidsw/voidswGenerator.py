from __future__ import annotations

import os
from pathlib import Path
from typing import TYPE_CHECKING

from ... import Command
from ...controller import generate_sdl_game_controller_config
from ..Generator import Generator

if TYPE_CHECKING:
    from ...types import HotkeysContext

class VoidswGenerator(Generator):

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        addon = "-addon0"
        if  "WD" in rom.name:
            addon = "-addon1"

        if  "TD" in rom.name:
            addon = "-addon2"

        commandArray = ["voidsw", addon, "-j", str(Path(rom.resolve().parent))]
        os.chdir(Path(rom.resolve().parent))

        return Command.Command(
            array=commandArray,
            env={
                'SDL_JOYSTICK_HIDAPI': '0', \
                'SDL_GAMECONTROLLERCONFIG': generate_sdl_game_controller_config(playersControllers)
            })

    def getHotkeysContext(self) -> HotkeysContext:
        return {
            "name": "viodsw",
            "keys": { "exit": ["KEY_LEFTALT", "KEY_F4"] }
        }
