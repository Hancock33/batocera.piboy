from __future__ import annotations

from typing import TYPE_CHECKING

import os
from ... import Command
from ...controller import generate_sdl_game_controller_config
from ..Generator import Generator

if TYPE_CHECKING:
    from ...types import HotkeysContext

class AwglGenerator(Generator):

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        os.chdir("/userdata/roms/ports/awgl")
        commandArray = ["awgl"]

        if  "15th" in rom.name:
            commandArray.append("--datapath=/userdata/roms/ports/awgl/15th")

        if  "20th" in rom.name:
            commandArray.append("--datapath=/userdata/roms/ports/awgl/20th")

        if  "3DO" in rom.name:
            commandArray.append("--datapath=/userdata/roms/ports/awgl/3DO")

        if  "Amiga" in rom.name:
            commandArray.append("--datapath=/userdata/roms/ports/awgl/Amiga")

        if  "Atari" in rom.name:
            commandArray.append("--datapath=/userdata/roms/ports/awgl/Atari")

        if  "DOS" in rom.name:
            commandArray.append("--datapath=/userdata/roms/ports/awgl/DOS")
            commandArray.append("--mt32")

        if  "Win31" in rom.name:
            commandArray.append("--datapath=/userdata/roms/ports/awgl/Win31")

        # Rendering mode
        if system.isOptSet("awgl_render"):
            if system.config['awgl_render'] == 'original':
                commandArray.append("--render=original")
            elif system.config['awgl_render'] == 'software':
                commandArray.append("--render=software")
            elif system.config['awgl_render'] == 'gl':
                commandArray.append("--render=gl")
        else:
            commandArray.append("--render=original")

        # Screen mode
        if system.isOptSet("awgl_fullscreen"):
            if system.config['awgl_fullscreen'] == 'stretched':
                commandArray.append("--fullscreen")
            elif system.config['awgl_fullscreen'] == 'wide':
                commandArray.append("--fullscreen-ar")
        else:
            commandArray.append("--fullscreen")

        # Audio mode
        if system.isOptSet("awgl_audio"):
            if system.config['awgl_audio'] == 'original':
                commandArray.append("--audio=original")
            elif system.config['awgl_audio'] == 'remastered':
                commandArray.append("--audio=remastered")
        else:
            commandArray.append("--audio=original")

        # Language
        if system.isOptSet("awgl_language"):
            if system.config['awgl_language'] == 'us':
                commandArray.append("--language=us")
            elif system.config['awgl_language'] == 'fr':
                commandArray.append("--language=fr")
            elif system.config['awgl_language'] == 'de':
                commandArray.append("--language=de")
            elif system.config['awgl_language'] == 'es':
                commandArray.append("--language=es")
            elif system.config['awgl_language'] == 'it':
                commandArray.append("--language=it")
        else:
            commandArray.append("--language=us")

        # Game difficulty
        if system.isOptSet("awgl_difficulty"):
            if system.config['awgl_difficulty'] == 'easy':
                commandArray.append("--difficulty=easy")
            elif system.config['awgl_difficulty'] == 'normal':
                commandArray.append("--difficulty=normal")
            elif system.config['awgl_difficulty'] == 'hard':
                commandArray.append("--difficulty=hard")
        else:
            commandArray.append("--difficulty=easy")

        # EGA screen mode for DOS
        if system.isOptSet("awgl_egados") and system.config['awgl_egados'] == 'enabled':
            commandArray.append("--ega-palette")

        return Command.Command(
            array=commandArray,
            env={
                'SDL_GAMECONTROLLERCONFIG': generate_sdl_game_controller_config(playersControllers),
                'SDL_AUTO_UPDATE_JOYSTICKS': '0'
            })

    def getHotkeysContext(self) -> HotkeysContext:
        return {
            "name": "awgl",
            "keys": { "exit": ["KEY_LEFTALT", "KEY_F4"] }
        }
