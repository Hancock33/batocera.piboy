from __future__ import annotations

from typing import TYPE_CHECKING

from ... import Command
from ...batoceraPaths import CONFIGS, SAVES, SCREENSHOTS, mkdir_if_not_exists
from ...controller import generate_sdl_game_controller_config
from ...exceptions import InvalidConfiguration
from ...utils.buildargs import parse_args
from ...utils.configparser import CaseSensitiveConfigParser
from ..Generator import Generator
import os

if TYPE_CHECKING:
    from pathlib import Path

    from ...types import HotkeysContext

class Eduke32Generator(Generator):

    def getHotkeysContext(self):
        return {
            "name": "eduke32",
            "keys": { "exit": "killall -9 eduke32; killall -9 fury", "menu": "KEY_ESC", "pause": "KEY_ESC", "save_state": "KEY_F6", "restore_state": "KEY_F9" }
        }

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        os.chdir("/userdata/roms/ports/eduke32")

        rtsfile = rom.name.replace('.GRP', '.RTS').replace('.grp', '.rts').replace('.EDUKE', '.RTS').replace('.eduke', '.rts')
        if (rom.name.lower()).endswith('eduke'):
            edukegroup=open(rom).readline().rstrip()
            edukerom=rom.name.replace('.eduke', '.GRP').replace('.EDUKE', '.GRP')

            commandArray = ["eduke32", edukerom, "-game_dir", os.path.dirname(os.path.abspath(rom)), "-g", edukegroup, "-rts", rtsfile]
        else:
            commandArray = ["eduke32", rom, "-game_dir", os.path.dirname(os.path.abspath(rom)), "-rts", rtsfile]

        if system.isOptSet("nologo") == False:
            commandArray.extend(["-nologo"])

        if os.path.isfile('/tmp/piboy') and not os.path.isfile('/tmp/piboy_xrs'):
            os.system('piboy_keys eduke32.keys')
            return Command.Command(
                array=commandArray,
                env={
                'SDL_AUTO_UPDATE_JOYSTICKS': '0',
                'SDL_MOUSE_RELATIVE_SPEED_SCALE': '2.0'
            })
        else:
            return Command.Command(
                array=commandArray,
                env={
                'SDL_JOYSTICK_HIDAPI': '0', \
                'SDL_GAMECONTROLLERCONFIG': generate_sdl_game_controller_config(playersControllers)
            })
