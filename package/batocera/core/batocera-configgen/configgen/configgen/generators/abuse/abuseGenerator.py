from __future__ import annotations

from typing import TYPE_CHECKING

from ... import Command
from ...controller import generate_sdl_game_controller_config
from ..Generator import Generator

if TYPE_CHECKING:
    from ...types import HotkeysContext


class AbuseGenerator(Generator):

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        commandArray = ["abuse"]

        return Command.Command(
            array=commandArray,
            env={
                'SDL_GAMECONTROLLERCONFIG': generate_sdl_game_controller_config(playersControllers),
                'SDL_JOYSTICK_HIDAPI': "0",
                'ABUSE_PATH': '/userdata/roms/ports/abuse',
                'ABUSE_SAVE_PATH': '/userdata/saves/abuse'
            })

    def getHotkeysContext(self) -> HotkeysContext:
        return {
            "name": "abuse",
            "keys": { "exit": ["KEY_LEFTALT", "KEY_F4"] }
        }
