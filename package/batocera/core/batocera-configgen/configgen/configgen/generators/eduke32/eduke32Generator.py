from __future__ import annotations

from pathlib import Path
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
            edukegroup=Path(rom).open().readline().rstrip()
            edukerom=rom.name.replace('.eduke', '.GRP').replace('.EDUKE', '.GRP')

            commandArray = ["eduke32", edukerom, "-game_dir", Path(Path(rom).resolve()).parent, "-g", edukegroup, "-rts", rtsfile]
        else:
            commandArray = ["eduke32", rom, "-game_dir", Path(Path(rom).resolve()).parent, "-rts", rtsfile]

        if system.config.get_bool("nologo"):
            commandArray.extend(["-nologo"])

        return Command.Command(
            array=commandArray,
            env={
                'SDL_JOYSTICK_HIDAPI': '0',
                'SDL_GAMECONTROLLERCONFIG': generate_sdl_game_controller_config(playersControllers)
            })
