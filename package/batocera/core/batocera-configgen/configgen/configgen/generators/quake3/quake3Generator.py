import shutil
import os.path
from shutil import copyfile
from ... import Command
from ... import controllersConfig
from ..Generator import Generator
from . import quake3Config

class Quake3Generator(Generator):

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        quake3Config.writeCfgFiles(system, rom, playersControllers, gameResolution)

        commandArray = ["ioquake3", "+set", "fs_basePath", "/userdata/roms/ports/quake3" ]

        # get the game / mod to launch
        with open(rom, "r") as file:
            command_line = file.readline().strip()
            command_line_words = command_line.split()

        commandArray.extend(command_line_words)

        return Command.Command(
            array=commandArray,
            env={
                'SDL_GAMECONTROLLERCONFIG': controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })

    def getInGameRatio(self, config, gameResolution, rom):
        if gameResolution["width"] / float(gameResolution["height"]) > ((16.0 / 9.0) - 0.1):
            return 16/9
        return 4/3

    def getHotkeysContext(self):
        return {
            "name": "ioquake3",
            "keys": { "exit": ["KEY_LEFTALT", "KEY_F4"] }
        }