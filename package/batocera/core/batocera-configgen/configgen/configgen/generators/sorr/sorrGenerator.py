import os
from os import path

from ... import Command
from ...controller import generate_sdl_game_controller_config
from ..Generator import Generator

class SorrGenerator(Generator):
    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        os.chdir("/userdata/roms/ports/sorr")
        commandArray = ["/usr/bin32/sorr", "-i", "/userdata/roms/ports/sorr", rom]

        return Command.Command(
            array=commandArray,
            env={
            'LD_LIBRARY_PATH': '/usr/lib32:/usr/lib32/alsa-lib:/usr/lib32/spa-0.2/support',
            'LIBGL_DRIVERS_PATH': '/usr/lib32/dri',
            'ALSA_PLUGIN_DIR': '/usr/lib32/alsa-lib',
            'SPA_PLUGIN_DIR': '/usr/lib32/spa-0.2',
            'PIPEWIRE_MODULE_DIR': '/usr/lib32/pipewire-0.3',
            'SDL_GAMECONTROLLERCONFIG': generate_sdl_game_controller_config(playersControllers)
        })

    def getHotkeysContext(self):
        return {
            "name": "sorr",
            "keys": { "exit": ["KEY_LEFTALT", "KEY_F4"] }
        }
