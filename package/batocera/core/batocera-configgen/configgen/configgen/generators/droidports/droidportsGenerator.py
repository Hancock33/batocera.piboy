from __future__ import annotations

from typing import TYPE_CHECKING

from ... import Command
from ...controller import generate_sdl_game_controller_config
from ..Generator import Generator

if TYPE_CHECKING:
    from ...types import HotkeysContext

class DroidportsGenerator(Generator):

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        commandArray = ["/usr/bin32/gmloader", rom]

        return Command.Command(
            array=commandArray,
            env={
                'LD_LIBRARY_PATH': '/usr/lib32:/usr/lib32/alsa-lib:/usr/lib/spa-0.2/support',
                'LIBGL_DRIVERS_PATH': '/usr/lib32/dri',
                'ALSA_PLUGIN_DIR': '/usr/lib32/alsa-lib',
                'SPA_PLUGIN_DIR': '/usr/lib32/spa-0.2',
                'PIPEWIRE_MODULE_DIR': '/usr/lib32/pipewire-0.3',
                'SDL_GAMECONTROLLERCONFIG': generate_sdl_game_controller_config(playersControllers)
            })

    def getHotkeysContext(self) -> HotkeysContext:
        return {
            "name": "droidports",
            "keys": { "exit": ["KEY_LEFTALT", "KEY_F4"] }
        }
