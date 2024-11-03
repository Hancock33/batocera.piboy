from __future__ import annotations

from pathlib import Path
from typing import TYPE_CHECKING

from ... import Command
from ...batoceraPaths import CONFIGS, SAVES, SCREENSHOTS, mkdir_if_not_exists
from ...controller import generate_sdl_game_controller_config
from ...utils.buildargs import parse_args
from ...utils.configparser import CaseSensitiveConfigParser
from ..Generator import Generator
import os

if TYPE_CHECKING:
    from ...types import HotkeysContext

class IonfuryGenerator(Generator):

    def getHotkeysContext(self):
        return {
            "name": "ionfury",
            "keys": { "exit": ["KEY_LEFTALT", "KEY_F4"], "menu": "KEY_ESC", "pause": "KEY_ESC", "save_state": "KEY_F8", "restore_state": "KEY_F9" }
        }

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        commandArray = ["ionfury", "-game_dir", os.path.dirname(os.path.abspath(rom)), "-g", rom]

        if system.isOptSet("nologo") == False:
            commandArray.extend(["-nologo"])

        os.chdir(os.path.dirname(os.path.abspath(rom)))

        if os.path.isfile('/tmp/piboy') and not os.path.isfile('/tmp/piboy_xrs'):
            os.system('piboy_keys ionfury.keys')
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
                'SDL_GAMECONTROLLERCONFIG': generate_sdl_game_controller_config(playersControllers)
            })
