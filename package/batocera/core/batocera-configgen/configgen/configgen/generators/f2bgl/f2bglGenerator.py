from __future__ import annotations

import os
from typing import TYPE_CHECKING

from ... import Command
from ...controller import generate_sdl_game_controller_config
from ..Generator import Generator

if TYPE_CHECKING:
    from ...types import HotkeysContext

class F2bglGenerator(Generator):

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        os.chdir("/userdata/roms/ports/f2bgl")
        commandArray = ["f2bgl", "--fullscreen", "--datapath=/userdata/roms/ports/f2bgl", "--savepath=/userdata/saves/f2bgl"]

        if system.config.get_bool('f2b_fog'):
            commandArray.extend(['--no-fog'])

        if system.config.get_bool('f2b_gouraud'):
            commandArray.extend(['--no-gouraud'])

        if system.config('f2b_filter'):
            strf2b_filter = '--texturefilter=' + system.config['f2b_filter']
            commandArray.extend([strf2b_filter])

        if system.config('f2b_scaler'):
            strf2b_scaler = '--texturescaler=' + system.config['f2b_scaler']
            commandArray.extend([strf2b_scaler])

        if system.config.get_bool('f2b_sub'):
            commandArray.extend(['--subtitles'])

        if system.config('f2b_lang'):
            strf2b_lang = '--language=' + system.config['f2b_lang'] + ' --voice=' + system.config['f2b_lang']
            commandArray.extend([strf2b_lang])

        if system.config('f2b_level'):
            strf2b_level = '--level=' + system.config['f2b_level']
            commandArray.extend([strf2b_level])

        return Command.Command(
            array=commandArray,
            env={
                'SDL_GAMECONTROLLERCONFIG': generate_sdl_game_controller_config(playersControllers)
            })

    def getHotkeysContext(self) -> HotkeysContext:
        return {
            "name": "f2bgl",
            "keys": { "exit": ["KEY_LEFTALT", "KEY_F4"] }
        }
