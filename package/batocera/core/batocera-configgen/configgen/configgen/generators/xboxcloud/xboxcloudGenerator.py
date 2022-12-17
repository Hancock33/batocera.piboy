#!/usr/bin/env python
import os
import shutil
from os import path
import Command
from generators.Generator import Generator
import controllersConfig

class XboxcloudGenerator(Generator):

    def generate(self, system, rom, playersControllers, guns, gameResolution):
        os.chdir("/opt/Greenlight")
        commandArray = ["/opt/Greenlight/greenlight", "--no-sandbox", "--fullscreen"]

        return Command.Command(
            array=commandArray,
            env={
              'SDL_GAMECONTROLLERCONFIG': controllersConfig.generateSdlGameControllerConfig(playersControllers)
        })
