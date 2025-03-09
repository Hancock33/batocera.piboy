from __future__ import annotations

from typing import TYPE_CHECKING
import os

from ... import Command
from ...controller import generate_sdl_game_controller_config
from ..Generator import Generator

class SerioussamGenerator(Generator):

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        # Determine the emulator
        sam_rom = rom.name.lower()
        data_dir = '/usr/share/game_assets/samtse/Bin'

        if (sam_rom.__contains__("/samtfe/")):
            data_dir = '/usr/share/game_assets/samtfe/Bin'
        elif (sam_rom.__contains__("/samtse/")):
            data_dir = '/usr/share/game_assets/samtse/Bin'

        os.chdir(data_dir)
        commandArray = [data_dir + '/serioussam']

        return Command.Command(
            array=commandArray,
            env={
                'LD_LIBRARY_PATH': '/usr/lib:/lib:' + data_dir,
                'SDL_GAMECONTROLLERCONFIG': generate_sdl_game_controller_config(playersControllers)
        })

    def getHotkeysContext(self) -> HotkeysContext:
        return {
            "name": "serioussam",
            "keys": { "exit": ["KEY_LEFTALT", "KEY_F4"] }
        }
