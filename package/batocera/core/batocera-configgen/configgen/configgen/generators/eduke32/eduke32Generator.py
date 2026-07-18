from __future__ import annotations

import os
from typing import TYPE_CHECKING

from ... import Command
from ...controller import generate_sdl_game_controller_config
from ..Generator import Generator

if TYPE_CHECKING:
    from ...types import HotkeysContext

class Eduke32Generator(Generator):

    def getHotkeysContext(self) -> HotkeysContext:
        return {
            "name": "eduke32",
            "keys": {
                "exit": "killall -9 eduke32; killall -9 fury",
                "menu": "KEY_ESC",
                "pause": "KEY_ESC",
                "save_state": "KEY_F6",
                "restore_state": "KEY_F9",
                "screenshot": "KEY_F12"
            }
        }

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        rtsfile = rom.name.replace('.GRP', '.RTS').replace('.grp', '.rts').replace('.EDUKE', '.RTS').replace('.eduke', '.rts')
        if (rom.name.lower()).endswith('eduke'):
            edukegroup=open(rom).readline().rstrip()
            edukerom=rom.name.replace('.eduke', '.GRP').replace('.EDUKE', '.GRP')

            commandArray = ["eduke32", edukerom, "-game_dir", os.path.dirname(os.path.abspath(rom)), "-g", edukegroup, "-rts", rtsfile]
        else:
            commandArray = ["eduke32", rom, "-game_dir", os.path.dirname(os.path.abspath(rom)), "-rts", rtsfile]

        if not system.isOptSet("nologo"):
            commandArray.extend(["-nologo"])

        return Command.Command(
            array=commandArray,
            env={
                'SDL_JOYSTICK_HIDAPI': '0', \
                'SDL_GAMECONTROLLERCONFIG': generate_sdl_game_controller_config(playersControllers)
            })
