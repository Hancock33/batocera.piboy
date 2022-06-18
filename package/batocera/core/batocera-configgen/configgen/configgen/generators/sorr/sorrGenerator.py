#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig
import os

class SorrGenerator(Generator):

    def generate(self, system, rom, playersControllers, guns, gameResolution):
        os.chdir("/userdata/roms/ports/sorr")
        commandArray = ["/usr/bin32/bgdi", "-i", "/userdata/roms/ports/sorr", rom]

        return Command.Command(
            array=commandArray,
            env={
                'LD_LIBRARY_PATH': '/usr/lib32:/usr/lib32/alsa-lib:/usr/lib/spa-0.2/support',
                'LIBGL_DRIVERS_PATH': '/usr/lib32/dri',
                'ALSA_PLUGIN_DIR': '/usr/lib32/alsa-lib',
                'SPA_PLUGIN_DIR': '/usr/lib32/spa-0.2',
                'PIPEWIRE_MODULE_DIR': '/usr/lib32/pipewire-0.3',
                'SDL_AUTO_UPDATE_JOYSTICKS': '0'
            })
