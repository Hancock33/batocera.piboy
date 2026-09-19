from __future__ import annotations

from pathlib import Path
from typing import Final

from batocera_common.dataclasses import cached_dataclass, cached_property
from batocera_launch import Command, Emulator, HotkeysContext

_TEKWAR_CONFIG_DIR: Final = Path('/userdata/system/configs/tekwar')
_TEKWAR_INI: Final = _TEKWAR_CONFIG_DIR / 'tekwar.ini'


@cached_dataclass
class Etekwar(Emulator):
    needs_sdl_game_controller_config = True

    @cached_property
    def hotkeygen_context(self) -> HotkeysContext:
        return {
            'name': 'etekwar',
            'keys': {'exit': ['KEY_LEFTALT', 'KEY_F4']},
        }

    async def configure(self) -> Command:
        _TEKWAR_CONFIG_DIR.mkdir(parents=True, exist_ok=True)

        if _TEKWAR_INI.exists():
            _TEKWAR_INI.unlink()

        with _TEKWAR_INI.open('w', encoding='ascii') as f:
            f.write(
                'fullscreen = 1\n'
                f'xdim = {self.resolution.width}\n'
                f'ydim = {self.resolution.height}\n'
                'renderer = 3\n'
                'music = 1\n'
                'mouse = 1\n'
                'joystick = 0\n'
                'keyforward = C8\n'
                'keybackward = D0\n'
                'keyturnleft = CB\n'
                'keyturnright = CD\n'
                'keyrun = 2A\n'
                'keystrafe = 38\n'
                'keyfire = 1D\n'
                'keyuse = 39\n'
                'keystandhigh = 2D\n'
                'keystandlow = 2E\n'
                'keylookup = C9\n'
                'keylookdown = D1\n'
                'keystrafeleft = 33\n'
                'keystraferight = 34\n'
                'key2dmode = 20\n'
                'keyviewcycle = 9C\n'
                'key2dzoomin = 1A\n'
                'key2dzoomout = 1B\n'
                'keychat = 32\n'
                'keyconsole = C7\n'
            )

        return Command(
            ['etekwar'],
            env={
                'SDL_AUTO_UPDATE_JOYSTICKS': '0',
            },
        )
