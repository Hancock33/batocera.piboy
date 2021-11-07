#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig


class OpentyrianGenerator(Generator):

    def generate(self, system, rom, playersControllers, gameResolution):
        commandArray = ["opentyrian", "-t" "/usr/share/opentyrian/data/", "-j"]

        return Command.Command(
            array=commandArray,
            env={
                'SDL_GAMECONTROLLERCONFIG': controllersConfig.generateSdlGameControllerConfig(playersControllers),
                'PIPEWIRE_LATENCY': '1024/48000'
            })
