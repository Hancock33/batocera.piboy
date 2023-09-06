#!/usr/bin/env python
import os
from os import path
import Command
from generators.Generator import Generator
import controllersConfig

class DroidportsGenerator(Generator):

    def generate(self, system, rom, playersControllers, guns, wheels, gameResolution):
        commandArray = ["/usr/bin32/gmloader", rom]

        if os.path.isfile('/tmp/piboy'):
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
        else:
            return Command.Command(
                array=commandArray,
                env={
                    'LD_LIBRARY_PATH': '/usr/lib32:/usr/lib32/alsa-lib:/usr/lib/spa-0.2/support',
                    'LIBGL_DRIVERS_PATH': '/usr/lib32/dri',
                    'ALSA_PLUGIN_DIR': '/usr/lib32/alsa-lib',
                    'SPA_PLUGIN_DIR': '/usr/lib32/spa-0.2',
                    'PIPEWIRE_MODULE_DIR': '/usr/lib32/pipewire-0.3',
                    'SDL_GAMECONTROLLERCONFIG': controllersConfig.generateSdlGameControllerConfig(playersControllers)
                })
