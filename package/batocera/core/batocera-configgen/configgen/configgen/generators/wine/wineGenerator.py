from __future__ import annotations

import logging
import os
import subprocess
import glob
from pathlib import Path
from typing import TYPE_CHECKING

from ... import Command
from ...controller import generate_sdl_game_controller_config
from ...exceptions import BatoceraException
from ..Generator import Generator

if TYPE_CHECKING:
    from ...types import HotkeysContext

_logger = logging.getLogger(__name__)

class WineGenerator(Generator):

    def getHotkeysContext(self) -> HotkeysContext:
        return {
            "name": "wine",
            "keys": { "exit": "/usr/bin/batocera-wine windows stop" }
        }

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        if system.name == "windows_installers":
            commandArray = ["batocera-wine", "windows", "install", rom]
            return Command.Command(array=commandArray)
        elif system.name == "windows" or system.name == "popcap" or system.name == "bigfish":
            romExt = os.path.splitext(rom)[1]
            _logger.debug(f"rom path: %s", Path(rom))
            _logger.debug(f"rom file extension: %s", romExt)
            if romExt == ".wsquashfs":
                commandArray = ["batocera-wine", "windows", "play", rom]
            elif "squashfs" in str(rom) and romExt == "":
                romsInDir = glob.glob(glob.escape(rom) + '/*.wineexe')
                rom = romsInDir[0].replace('.wineexe','.exe')
                _logger.debug(f"wine squashfs rom: %s", rom)
                commandArray = ["batocera-wine", "windows", "play", rom]
            else:
                commandArray = ["batocera-wine", "windows", "play", rom]

            environment: dict[str, str | Path] = {}
            #system.language
            try:
                language = subprocess.check_output("batocera-settings-get system.language", shell=True, text=True).strip()
            except subprocess.CalledProcessError:
                language = 'en_US'
            if language:
                environment.update({
                    "LANG": language + ".UTF-8",
                    "LC_ALL": language + ".UTF-8"
                    }
                )
            # sdl controller option - default is on
            if system.config.get_bool("sdl_config", True):
                environment.update(
                    {
                        "SDL_GAMECONTROLLERCONFIG": generate_sdl_game_controller_config(playersControllers),
                        "SDL_JOYSTICK_HIDAPI": "0"
                    }
                )
            # ensure nvidia driver used for vulkan
            if Path('/var/tmp/nvidia.prime').exists():
                variables_to_remove = ['__NV_PRIME_RENDER_OFFLOAD', '__VK_LAYER_NV_optimus', '__GLX_VENDOR_LIBRARY_NAME']
                for variable_name in variables_to_remove:
                    if variable_name in os.environ:
                        del os.environ[variable_name]

                environment.update(
                    {
                        'VK_ICD_FILENAMES': '/usr/share/vulkan/icd.d/nvidia_icd.x86_64.json:/usr/share/vulkan/icd.d/nvidia_icd.i686.json',
                    }
                )

            return Command.Command(array=commandArray, env=environment)

        raise BatoceraException("Invalid system: " + system.name)

    def getMouseMode(self, config, rom):
        return config.get_bool('force_mouse')
