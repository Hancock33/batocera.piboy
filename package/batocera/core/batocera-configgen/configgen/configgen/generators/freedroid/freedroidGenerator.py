from __future__ import annotations

from typing import TYPE_CHECKING

from ... import Command, controllersConfig
from ..Generator import Generator
from ...controller import generate_sdl_game_controller_config

class FreedroidGenerator(Generator):

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        commandArray = ["freedroid", "-f"]

        return Command.Command(
            array=commandArray,
            env={
                "SDL_GAMECONTROLLERCONFIG": generate_sdl_game_controller_config(playersControllers)
            }
        )

    def getHotkeysContext(self) -> HotkeysContext:
        return {
            "name": "freedroid",
            "keys": { "exit": ["KEY_LEFTALT", "KEY_F4"] }
        }
