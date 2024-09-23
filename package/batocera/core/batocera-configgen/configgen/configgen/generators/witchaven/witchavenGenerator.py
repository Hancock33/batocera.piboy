import os

from ... import Command
from ... import batoceraFiles
from ..Generator import Generator

class WitchavenGenerator(Generator):

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        os.chdir("/userdata/roms/ports/witchaven")
        commandArray = ["ewitchaven"]

        return Command.Command(
            array=commandArray,
            env={
                'SDL_AUTO_UPDATE_JOYSTICKS': '0',
                'SDL_MOUSE_RELATIVE_SPEED_SCALE': '3.0'
            })
