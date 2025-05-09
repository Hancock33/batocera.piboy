from __future__ import annotations

from typing import TYPE_CHECKING

import os
from ... import Command
from ...controller import generate_sdl_game_controller_config
from ..Generator import Generator

if TYPE_CHECKING:
    from ...types import HotkeysContext

class AvpGenerator(Generator):

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        commandArray = ["avp", "-f", "-p", "/userdata/roms/ports/avp/", "-g", "/usr/lib/libGLESv2.so"]

        return Command.Command(
            array=commandArray,
            env={
                'SDL_GAMECONTROLLERCONFIG': generate_sdl_game_controller_config(playersControllers),
                'SDL_JOYSTICK_HIDAPI': "0"
            })

    def getHotkeysContext(self) -> HotkeysContext:
        return {
            "name": "avp",
            "keys": { "exit": ["KEY_LEFTALT", "KEY_F4"] }
        }
