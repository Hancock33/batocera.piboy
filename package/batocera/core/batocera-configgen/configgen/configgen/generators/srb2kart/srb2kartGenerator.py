from __future__ import annotations

from typing import TYPE_CHECKING

from ... import Command
from ...controller import generate_sdl_game_controller_config
from ..Generator import Generator

if TYPE_CHECKING:
    from ...types import HotkeysContext

class Srb2kartGenerator(Generator):

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        commandArray = ["srb2kart", rom]

        return Command.Command(
            array=commandArray,
            env={
                'SRB2WADDIR': '/userdata/roms/ports/srb2kart',
                'SDL_GAMECONTROLLERCONFIG': generate_sdl_game_controller_config(playersControllers)
            })

    def getHotkeysContext(self) -> HotkeysContext:
        return {
            "name": "srb2kart",
            "keys": { "exit": ["KEY_LEFTALT", "KEY_F4"] }
        }
