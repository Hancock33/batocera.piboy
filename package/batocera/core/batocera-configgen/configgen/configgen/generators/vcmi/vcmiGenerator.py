#!/usr/bin/env python
import os
import shutil
from os import path
import Command
from generators.Generator import Generator
import controllersConfig

class VcmiGenerator(Generator):

    def generate(self, system, rom, playersControllers, guns, gameResolution):
        commandArray = ["vcmiclient"]

        if os.path.isfile('/tmp/piboy'):
            shutil.copyfile('/usr/share/vcmi/settings_piboy.json', '/userdata/roms/ports/vcmi/settings.json')
        else:
            shutil.copyfile('/usr/share/vcmi/settings.json', '/userdata/roms/ports/vcmi/settings.json')

        return Command.Command(
            array=commandArray,
            env={
                'LD_LIBRARY_PATH': '/lib:/usr/lib:/usr/lib/vcmi:/usr/lib/vcmi/AI',
                'SDL_GAMECONTROLLERCONFIG': controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })
