import os
from ... import Command
from ... import controllersConfig
from ..Generator import Generator

class UqmGenerator(Generator):

    def getHotkeysContext(self):
        return {
            "name": "uqm",
            "keys": { "exit": ["KEY_LEFTALT", "KEY_F4"] }
        }

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        directories = [
            '/userdata/saves/uqm',
            '/userdata/saves/uqm/teams',
            '/userdata/saves/uqm/save'
        ]

        for directory in directories:
            os.makedirs(directory, exist_ok=True)

        with open('/userdata/roms/ports/uqm/version', 'a'): # Create file if does not exist
            pass

        res = f'{gameResolution["width"]}' + "x" + f'{gameResolution["height"]}'

        commandArray = ["urquan","-f","-o","-r", res,
                        "--contentdir=/userdata/roms/ports/uqm",
                        "--configdir=/userdata/saves/uqm","--addondir=/userdata/roms/ports/uqm/addons"]

        return Command.Command(
            array=commandArray,
            env={
                'SDL_GAMECONTROLLERCONFIG': controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })
