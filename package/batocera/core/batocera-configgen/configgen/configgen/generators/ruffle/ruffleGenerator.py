from __future__ import annotations

from typing import TYPE_CHECKING

from ... import Command
from ...controller import generate_sdl_game_controller_config
from ..Generator import Generator

if TYPE_CHECKING:
    from ...types import HotkeysContext


class RuffleGenerator(Generator):

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        commandArray = ["ruffle", "--force-scale", "--scale", "exact-fit", "--fullscreen", rom]

        return Command.Command(
            array=commandArray,
            env={
                'SDL_JOYSTICK_HIDAPI': '0',
                'SDL_GAMECONTROLLERCONFIG': generate_sdl_game_controller_config(playersControllers)
            })

    def getMouseMode(self, config, rom):
        return True

    def getHotkeysContext(self) -> HotkeysContext:
        return {
            "name": "ruffle",
            "keys": { "exit": ["KEY_LEFTALT", "KEY_F4"] }
        }
