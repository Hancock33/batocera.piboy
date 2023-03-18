#!/usr/bin/env python
import os
from os import path
import Command
from generators.Generator import Generator
import controllersConfig

class AbuseGenerator(Generator):
    if os.path.isfile('/tmp/piboy'):
        os.system('piboy_keys abuse.keys')

    def generate(self, system, rom, playersControllers, guns, gameResolution):
        commandArray = ["abuse", "-datadir", "/userdata/roms/abuse/abuse_data"]

        return Command.Command(
            array=commandArray,
            env={
                'SDL_AUTO_UPDATE_JOYSTICKS': '0'
            })
