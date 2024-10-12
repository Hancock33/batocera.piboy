from __future__ import annotations

from typing import TYPE_CHECKING

import os
from ... import Command, controllersConfig
from ...utils import videoMode as videoMode
from ..Generator import Generator

if TYPE_CHECKING:
    from ...types import HotkeysContext

class BstoneGenerator(Generator):

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        addon = "/userdata/roms/ports/bstone/SW"
        gver = "--aog_sw"
        gameResolution = videoMode.getCurrentResolution()

        if (rom.__contains__("AOG")):
            addon = "/userdata/roms/ports/bstone/AOG"
            gver = "--aog"

        if (rom.__contains__("PS")):
            addon = "/userdata/roms/ports/bstone/PS"
            gver = "--ps"

        if (rom.__contains__("SW")):
            addon = "/userdata/roms/ports/bstone/SW"
            gver = "--aog_sw"

        commandArray = ["bstone", gver, "--data_dir", addon, "--vid_is_vsync", "1", "--vid_is_ui_stretched", "1", "--vid_width", str(gameResolution["width"]), "--vid_height", str(gameResolution["height"])]

        return Command.Command(
            array=commandArray,
            env={
                'SDL_AUTO_UPDATE_JOYSTICKS': '0'
            })

    def getHotkeysContext(self) -> HotkeysContext:
        return {
            "name": "bstone",
            "keys": { "exit": ["KEY_LEFTALT", "KEY_F4"] }
        }
