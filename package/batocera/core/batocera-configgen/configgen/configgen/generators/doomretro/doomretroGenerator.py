from __future__ import annotations

import shlex

from typing import TYPE_CHECKING

from ... import Command
from ...controller import generate_sdl_game_controller_config
from ..Generator import Generator
import pathlib

if TYPE_CHECKING:
    from ...types import HotkeysContext

class DoomretroGenerator(Generator):
    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):

        iwad = ''
        pwad = ''

        if ".uwad" in rom.name:
            f=pathlib.Path(rom).open()
            content=f.readlines()
            for line in content:
                if 'IWAD=/' in line:
                    iwad += line.replace('IWAD=', '').replace('\n', ' ')
                elif 'PWAD=/' in line:
                    pwad += line.replace('PWAD=', '').replace('\n', ' ')
            iwad_command = '-iwad ' + iwad + ' #-file ' + pwad
            args = shlex.split(iwad_command)
        else:
            iwad_command = '-iwad ' + rom.name
            args = shlex.split(iwad_command)

        commandArray = ['doomretro', *args]

        return Command.Command(
            array=commandArray,
            env={
            'DOOMWADDIR': '/userdata/roms/ports/doom',
            'SDL_GAMECONTROLLERCONFIG': generate_sdl_game_controller_config(playersControllers)
        })

    def getHotkeysContext(self) -> HotkeysContext:
        return {
            "name": "prboom",
            "keys": { "exit": ["KEY_LEFTALT", "KEY_F4"] }
        }
