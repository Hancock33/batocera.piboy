import os

from ... import Command
from ... import controllersConfig
from ..Generator import Generator

class OpenJazzGenerator(Generator):

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        gamedir = rom.replace('openjazz.game', '')
        commandArray = ["OpenJazz", gamedir]

        return Command.Command(
            array=commandArray,
            env={
                'SDL_AUTO_UPDATE_JOYSTICKS': '0'
            })
