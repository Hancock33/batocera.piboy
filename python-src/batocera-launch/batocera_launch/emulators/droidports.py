from __future__ import annotations

from pathlib import Path
from typing import Final

from batocera_common.dataclasses import cached_dataclass, cached_property
from batocera_launch import Command, Emulator, HotkeysContext

_GMLOADER_BIN: Final = Path('/usr/bin32/gmloader')
_LIB32: Final = Path('/usr/lib32')


@cached_dataclass
class Droidports(Emulator):
    needs_sdl_game_controller_config = True

    @cached_property
    def hotkeygen_context(self) -> HotkeysContext:
        return {
            'name': 'gmloader',
            'keys': {'exit': ['KEY_LEFTALT', 'KEY_F4']},
        }

    async def configure(self) -> Command:
        return Command(
            [_GMLOADER_BIN, self.rom],
            env={
                'LD_LIBRARY_PATH': f'{_LIB32}:{_LIB32 / "alsa-lib"}:/usr/lib/spa-0.2/support',
                'LIBGL_DRIVERS_PATH': _LIB32 / 'dri',
                'ALSA_PLUGIN_DIR': _LIB32 / 'alsa-lib',
                'SPA_PLUGIN_DIR': _LIB32 / 'spa-0.2',
                'PIPEWIRE_MODULE_DIR': _LIB32 / 'pipewire-0.3',
            },
        )
