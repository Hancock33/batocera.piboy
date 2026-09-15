from __future__ import annotations

from batocera_common.dataclasses import cached_dataclass, cached_property
from batocera_launch import Command, Emulator, HotkeysContext


@cached_dataclass
class Droidports(Emulator):
    needs_sdl_game_controller_config = True

    @cached_property
    def hotkeygen_context(self) -> HotkeysContext:
        return {
            'name': 'droidports',
            'keys': {'exit': ['KEY_LEFTALT', 'KEY_F4']},
        }

    async def configure(self) -> Command:
        return Command(
            ['droidports', self.rom],
            env={
                'LD_LIBRARY_PATH': '/usr/lib32:/usr/lib32/alsa-lib:/usr/lib/spa-0.2/support',
                'LIBGL_DRIVERS_PATH': '/usr/lib32/dri',
                'ALSA_PLUGIN_DIR': '/usr/lib32/alsa-lib',
                'SPA_PLUGIN_DIR': '/usr/lib32/spa-0.2',
                'PIPEWIRE_MODULE_DIR': '/usr/lib32/pipewire-0.3',
            },
        )
