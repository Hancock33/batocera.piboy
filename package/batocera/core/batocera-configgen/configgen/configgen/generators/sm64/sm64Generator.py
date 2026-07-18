from __future__ import annotations

import os

from typing import TYPE_CHECKING

from ... import Command
from ...controller import generate_sdl_game_controller_config
from ..Generator import Generator
import pathlib

if TYPE_CHECKING:
    from ...types import HotkeysContext

eu_dir = '/userdata/saves/sm64/eu'
jp_dir = '/userdata/saves/sm64/jp'
us_dir = '/userdata/saves/sm64/us'

class Sm64Generator(Generator):

    if not pathlib.Path(eu_dir).exists():
        pathlib.Path(eu_dir).mkdir()

    if not pathlib.Path(jp_dir).exists():
        pathlib.Path(jp_dir).mkdir()

    if not pathlib.Path(us_dir).exists():
        pathlib.Path(us_dir).mkdir()

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        if str(rom).lower().endswith('.e64'):
            os.chdir(rom)
            commandArray = ["sm64.eu", "--gamedir", "./", '--savepath', eu_dir]
        if str(rom).lower().endswith('.j64'):
            os.chdir(rom)
            commandArray = ["sm64.jp", "--gamedir", "./", '--savepath', jp_dir]
        if str(rom).lower().endswith('.u64'):
            os.chdir(rom)
            commandArray = ["sm64.us", "--gamedir", "./", '--savepath', us_dir]

        # Skip Intro
        if system.isOptSet('nointro') and system.getOptBoolean('nointro'):
            commandArray.extend(['--skip-intro'])

        # Cheat Menu
        if system.isOptSet('cheatsmenu') and system.getOptBoolean('cheatsmenu'):
            commandArray.extend(['--cheats'])

        return Command.Command(
            array=commandArray,
            env={
                'SDL_GAMECONTROLLERCONFIG': generate_sdl_game_controller_config(playersControllers)
            })

    def getHotkeysContext(self) -> HotkeysContext:
        return {
            "name": "sm64",
            "keys": { "exit": ["KEY_LEFTALT", "KEY_F4"] }
        }
