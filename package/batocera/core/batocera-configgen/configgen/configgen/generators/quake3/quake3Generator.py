#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig


class Quake3Generator(Generator):

    def generate(self, system, rom, playersControllers, gameResolution):
        commandArray = ["ioquake3", "+set", "cl_renderer", "vulkan"]

        return Command.Command(
            array=commandArray,
            env={
                'SDL_GAMECONTROLLERCONFIG': controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })
