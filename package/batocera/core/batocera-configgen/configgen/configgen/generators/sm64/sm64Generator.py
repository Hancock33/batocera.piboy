from __future__ import annotations

import os
import pathlib
from typing import TYPE_CHECKING

from ... import Command
from ...controller import generate_sdl_game_controller_config
from ..Generator import Generator

if TYPE_CHECKING:
    from ...types import HotkeysContext

eu_dir = '/userdata/saves/sm64/eu'
jp_dir = '/userdata/saves/sm64/jp'
us_dir = '/userdata/saves/sm64/us'

class Sm64Generator(Generator):
    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        commandArray = ["sm64.eu", "--gamedir", "./", '--savepath', eu_dir]

        if str(rom).lower().endswith('.e64'):
            if not pathlib.Path(eu_dir).exists():
                pathlib.Path(eu_dir).mkdir()
        
        if str(rom).lower().endswith('.j64'):
            if not pathlib.Path(jp_dir).exists():
                pathlib.Path(jp_dir).mkdir()
            commandArray = ["sm64.jp", "--gamedir", "./", '--savepath', jp_dir]

        if str(rom).lower().endswith('.u64'):
            if not pathlib.Path(us_dir).exists():
                pathlib.Path(us_dir).mkdir()
            commandArray = ["sm64.us", "--gamedir", "./", '--savepath', us_dir]

        os.chdir(rom)

        # Skip Intro
        if system.config.get_bool('nointro'):
            commandArray.extend(['--skip-intro'])

        # Cheat Menu
        if system.config.get_bool('cheatsmenu'):
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
