from __future__ import annotations

import pathlib
from typing import TYPE_CHECKING

from ... import Command
from ...controller import generate_sdl_game_controller_config
from ..Generator import Generator

if TYPE_CHECKING:
    from ...types import HotkeysContext

class IonfuryGenerator(Generator):

    def getHotkeysContext(self) -> HotkeysContext:
        return {
            "name": "ionfury",
            "keys": { "exit": ["KEY_LEFTALT", "KEY_F4"], "menu": "KEY_ESC", "pause": "KEY_ESC", "save_state": "KEY_F8", "restore_state": "KEY_F9" }
        }

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        commandArray = ["ionfury", "-game_dir", pathlib.Path(pathlib.Path(rom).resolve()).parent, "-g", rom]

        if not system.isOptSet("nologo"):
            commandArray.extend(["-nologo"])

        return Command.Command(
            array=commandArray,
            env={
                'SDL_JOYSTICK_HIDAPI': '0', \
                'SDL_GAMECONTROLLERCONFIG': generate_sdl_game_controller_config(playersControllers)
            })
