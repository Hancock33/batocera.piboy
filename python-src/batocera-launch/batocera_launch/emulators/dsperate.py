from __future__ import annotations

import configparser
from typing import Final

from batocera_common.configparser import CaseSensitiveConfigParser
from batocera_common.dataclasses import cached_dataclass, cached_property
from batocera_common.paths import BIOS, CACHE, CHEATS, CONFIGS, SAVES, SCREENSHOTS
from batocera_launch import Command, Emulator, HotkeysContext

_DSPERATE_CONFIG: Final = CONFIGS / 'dsperate'
_DSPERATE_INI: Final = _DSPERATE_CONFIG / 'dsperate.ini'
_DSPERATE_SAVES: Final = SAVES / 'nds'
_DSPERATE_STATES: Final = SAVES / 'nds' / 'dsperate'
_DSPERATE_CHEATS: Final = CHEATS / 'dsperate'
_DSPERATE_CACHE: Final = CACHE / 'dsperate'

# optional dumps; DSperate falls back to its built-in FreeBIOS and generated firmware
_BIOS_FILES: Final = {
    'bios9': 'bios9.bin',
    'bios7': 'bios7.bin',
    'firmware': 'firmware.bin',
    'bios9i': 'dsi_bios9.bin',
    'bios7i': 'dsi_bios7.bin',
    'dsi_nand': 'dsi_nand.bin',
}

# hotkeygen turns the pad hotkeys into these keyboard keys, so DSperate's own pad hotkeys are disabled
_PAD_HOTKEYS: Final = (
    'quit',
    'pause',
    'fast_forward',
    'save_state',
    'load_state',
    'slot_next',
    'slot_prev',
    'layout_next',
    'layout_prev',
    'screen_swap',
)


def _bool(value: bool) -> str:
    return 'true' if value else 'false'


@cached_dataclass
class DSperate(Emulator):
    needs_sdl_game_controller_config = True

    @cached_property
    def hotkeygen_context(self) -> HotkeysContext:
        return {
            'name': 'dsperate',
            'keys': {
                'exit': 'KEY_ESC',
                'menu': 'KEY_P',
                'pause': 'KEY_P',
                'save_state': 'KEY_F5',
                'restore_state': 'KEY_F7',
                'next_slot': 'KEY_F3',
                'previous_slot': 'KEY_F2',
                'fastforward': 'KEY_TAB',
                'screenshot': 'KEY_F9',
                'swap_screen': 'KEY_F6',
            },
        }

    async def configure(self) -> Command:
        for directory in (_DSPERATE_CONFIG, _DSPERATE_SAVES, _DSPERATE_STATES, _DSPERATE_CHEATS, _DSPERATE_CACHE):
            directory.mkdir(parents=True, exist_ok=True)

        # keep what the user set in DSperate's own menu, only the keys below are rewritten every launch
        ini = CaseSensitiveConfigParser(interpolation=None)
        if _DSPERATE_INI.exists():
            ini.read(_DSPERATE_INI)

        def section(name: str, /) -> configparser.SectionProxy:
            if not ini.has_section(name):
                ini.add_section(name)
            return ini[name]

        paths = section('paths')
        for key, filename in _BIOS_FILES.items():
            if (BIOS / filename).exists():
                paths[key] = str(BIOS / filename)
            else:
                paths.pop(key, None)
        paths['saves'] = str(_DSPERATE_SAVES)
        paths['states'] = str(_DSPERATE_STATES)
        paths['screenshots'] = str(SCREENSHOTS)
        paths['cache'] = str(_DSPERATE_CACHE)
        if (cheats := _DSPERATE_CHEATS / 'usrcheat.dat').exists():
            paths['cheats'] = str(cheats)

        user = section('user')
        user['language'] = str(self.config.get_int('dsperate_language', 1))

        video = section('video')
        video['fullscreen'] = 'true'
        video['dual_window'] = 'false'
        video['layout'] = self.config.get_str('dsperate_layout', 'vertical')
        video['screen'] = self.config.get_str('dsperate_screen', 'top')
        video['integer_scale'] = self.config.get_str('dsperate_integer_scale', 'off')
        video['linear'] = _bool(self.config.get_bool('dsperate_linear'))
        video['colour'] = self.config.get_str('dsperate_colour', 'off')
        video['gpu3d'] = _bool(self.config.get_bool('dsperate_gpu3d'))
        video['gpu3d_scale'] = str(self.config.get_int('dsperate_gpu3d_scale', 1))
        video['vsync'] = _bool(self.config.get_bool('dsperate_vsync', True))
        video['fps'] = _bool(self.config.show_fps)

        emu = section('emu')
        emu['timing'] = self.config.get_str('dsperate_timing', 'fast')
        emu['frameskip'] = str(self.config.get_int('dsperate_frameskip', 0))

        pad_hotkeys = section('padhotkeys')
        for key in _PAD_HOTKEYS:
            pad_hotkeys[key] = 'none'

        with _DSPERATE_INI.open('w') as fp:
            ini.write(fp)

        return Command(
            ['/usr/bin/dsperate', self.rom],
            env={
                'XDG_CONFIG_HOME': CONFIGS,
            },
        )
