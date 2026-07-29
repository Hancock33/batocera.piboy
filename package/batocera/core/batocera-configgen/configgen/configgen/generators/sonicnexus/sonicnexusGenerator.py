from __future__ import annotations

import os
import shutil
from pathlib import Path
from typing import TYPE_CHECKING

from ... import Command
from ...controller import generate_sdl_game_controller_config, write_sdl_controller_db
from ..Generator import Generator

if TYPE_CHECKING:
    from ...types import HotkeysContext

class SonicNexusGenerator(Generator):

    def getHotkeysContext(self) -> HotkeysContext:
        return {
            "name": "sonicnexus",
            "keys": { "exit": ["KEY_LEFTALT", "KEY_F4"], "menu": "KEY_ENTER", "pause": "KEY_ENTER" }
        }

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):

        source_file = Path('/usr/bin/sonicnexus')
        rom_directory = Path('/userdata/roms/ports/sonicnexus')
        destination_file = Path(str(rom_directory) + '/sonicnexus')

        if destination_file.exists():
            os.remove(destination_file)
            shutil.copy(source_file, destination_file)
        else:
            shutil.copy(source_file, destination_file)

        ## Configuration

        # VSync
        if system.isOptSet('snexus_vsync'):
            selected_vsync = system.config['snexus_vsync']
        else:
            selected_vsync = 'y'

        write_sdl_controller_db(playersControllers, rom_directory / "gamecontrollerdb.txt")

        # Now run
        os.chdir(rom_directory)
        commandArray = [destination_file]

        return Command.Command(
            array=commandArray,
            env={
                "SDL_GAMECONTROLLERCONFIG": generate_sdl_game_controller_config(playersControllers),
                "SDL_JOYSTICK_HIDAPI": "0"
            }
        )

    # Show mouse for menu / play actions
    def getMouseMode(self, config, rom):
        return False

    def getInGameRatio(self, config, gameResolution, rom):
        return 16/9
