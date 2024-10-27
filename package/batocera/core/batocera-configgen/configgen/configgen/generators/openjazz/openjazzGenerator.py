from __future__ import annotations

import logging
import os

from ... import Command
from ...batoceraPaths import ROMS
from ...controller import generate_sdl_game_controller_config
from ..Generator import Generator

eslog = logging.getLogger(__name__)


class OpenJazzGenerator(Generator):

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        gamedir = rom.replace('openjazz.game', '')
        commandArray = ["OpenJazz", gamedir]

        return Command.Command(
            array=commandArray,
            env={
                'SDL_GAMECONTROLLERCONFIG': generate_sdl_game_controller_config(playersControllers)
            })
