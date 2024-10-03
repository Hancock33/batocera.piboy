from __future__ import annotations

import os
from pathlib import Path
from typing import TYPE_CHECKING, Final

from ... import Command, controllersConfig
from ...batoceraPaths import BIOS, HOME, ROMS, SCREENSHOTS, ensure_parents_and_open
from ...utils.logger import get_logger
from ..Generator import Generator

if TYPE_CHECKING:
    from ...types import HotkeysContext

eslog = get_logger(__name__)

PICO8_BIN_PATH: Final = BIOS / "pico-8" / "pico8"
PICO8_ROOT_PATH: Final = ROMS / "pico8"
PICO8_CONTROLLERS: Final = HOME / ".lexaloffle" / "pico-8" / "sdl_controllers.txt"
VOX_BIN_PATH: Final = BIOS / "voxatron" / "vox"
VOX_ROOT_PATH: Final = ROMS / "voxatron"
VOX_CONTROLLERS: Final = HOME / ".lexaloffle" / "Voxatron" / "sdl_controllers.txt"


# Generator for the official pico8 binary from Lexaloffle
class LexaloffleGenerator(Generator):

    def getHotkeysContext(self) -> HotkeysContext:
        return {
            "name": "lexaloffle",
            "keys": { "exit": ["KEY_LEFTCTRL", "KEY_Q"] }
        }

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        rom_path = Path(rom)

        if (system.name == "pico8"):
            BIN_PATH=PICO8_BIN_PATH
            CONTROLLERS=PICO8_CONTROLLERS
            ROOT_PATH=PICO8_ROOT_PATH
        elif (system.name == "voxatron"):
            BIN_PATH=VOX_BIN_PATH
            CONTROLLERS=VOX_CONTROLLERS
            ROOT_PATH=VOX_ROOT_PATH
        else:
            eslog.error(f"The Lexaloffle generator has been called for an unknwon system: {system.name}.")
            return -1
        if not BIN_PATH.exists():
            eslog.error(f"Lexaloffle official binary not found at {BIN_PATH}")
            return -1
        if not os.access(BIN_PATH, os.X_OK):
            eslog.error(f"File {BIN_PATH} is not set as executable")
            return -1

        # the command to run
        commandArray: list[str | Path] = [BIN_PATH]
        commandArray.extend(["-desktop", SCREENSHOTS])  # screenshots
        commandArray.extend(["-windowed", "0"])                     # full screen
        # Display FPS
        if system.config['showFPS'] == 'true':
                commandArray.extend(["-show_fps", "1"])
        else:
                commandArray.extend(["-show_fps", "0"])

        rombase = rom_path.stem

        # .m3u support for multi-cart pico-8
        if rom_path.suffix.lower() == ".m3u":
            with rom_path.open() as fpin:
                lines = fpin.readlines()
            fullpath = rom_path.absolute().parent / lines[0].strip()
            commandArray.extend(["-root_path", fullpath.parent])
            rom_path = fullpath
        else:
            commandArray.extend(["-root_path", ROOT_PATH]) # store carts from splore

        if (rombase.lower() == "splore" or rombase.lower() == "console"):
            commandArray.extend(["-splore"])
        else:
            commandArray.extend(["-run", rom])

        controllersconfig = controllersConfig.generateSdlGameControllerConfig(playersControllers)
        with ensure_parents_and_open(CONTROLLERS, "w") as file:
               file.write(controllersconfig)

        return Command.Command(array=commandArray, env={})

    def getInGameRatio(self, config, gameResolution, rom):
        return 4/3
