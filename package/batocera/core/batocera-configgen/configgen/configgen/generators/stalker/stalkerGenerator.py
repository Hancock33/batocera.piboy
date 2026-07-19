from __future__ import annotations

import logging
import os
from pathlib import Path

from ... import Command
from ...controller import generate_sdl_game_controller_config
from ..Generator import Generator

if TYPE_CHECKING:
    from pathlib import Path

    from ...types import HotkeysContext

_logger = logging.getLogger(__name__)

class StalkerGenerator(Generator):

    def getHotkeysContext(self) -> HotkeysContext:
        return {
            "name": "xr_3da",
            "keys": { "exit": ["KEY_LEFTALT", "KEY_F4"] }
        }

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):

        commandArray = ["xr_3da"]
        romExt = os.path.splitext(rom)[1]
        _logger.debug("rom path: %s", Path(rom))
        _logger.debug("rom file extension: %s", romExt.lower())

        # Skip Intro
        if system.isOptSet('stalker_intro') and system.getOptBoolean('stalker_intro'):
            commandArray.extend(['-nointro'])

        # Call of Clear Sky
        if romExt.lower() == ".cs":
            commandArray.extend(['-cs'])

        if romExt.lower() == ".soc":
            commandArray.extend(['-soc'])

        return Command.Command(
            array=commandArray,
            env={
                'SDL_GAMECONTROLLERCONFIG': generate_sdl_game_controller_config(playersControllers)
            })
