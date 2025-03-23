from __future__ import annotations

from typing import TYPE_CHECKING
import os

from ... import Command
from ...controller import generate_sdl_game_controller_config
from ..Generator import Generator

eu_dir = '/userdata/saves/sm64/eu'
jp_dir = '/userdata/saves/sm64/jp'
us_dir = '/userdata/saves/sm64/us'

class Sm64Generator(Generator):

    if not os.path.exists(eu_dir):
        os.mkdir(eu_dir)

    if not os.path.exists(jp_dir):
        os.mkdir(jp_dir)

    if not os.path.exists(us_dir):
        os.mkdir(us_dir)

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
