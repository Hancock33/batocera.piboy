from __future__ import annotations

import os
from pathlib import Path
from typing import TYPE_CHECKING, Final

from batocera_common.configparser import CaseSensitiveRawConfigParser
from batocera_common.dataclasses import cached_dataclass, cached_property
from batocera_common.paths import CACHE, CONFIGS, SAVES
from batocera_common.vulkan import get_vulkan_info
from batocera_launch import Command, Emulator, HotkeysContext

if TYPE_CHECKING:
    from batocera_launch import Controller, Controllers

_LICHII_BIN: Final = Path('/usr/bin/lichii')
_ROMS: Final = Path('/userdata/roms/switch')
_SAVES: Final = SAVES / 'switch'

_BACKEND_OPENGL: Final = '0'
_BACKEND_VULKAN: Final = '1'

_BUTTONMAPPING: Final[dict[str, str]] = {
    'button_a': 'a',
    'button_b': 'b',
    'button_x': 'x',
    'button_y': 'y',
    'button_dup': 'up',
    'button_ddown': 'down',
    'button_dleft': 'left',
    'button_dright': 'right',
    'button_l': 'pageup',
    'button_r': 'pagedown',
    'button_plus': 'start',
    'button_minus': 'select',
    'button_zl': 'l2',
    'button_zr': 'r2',
    'button_lstick': 'l3',
    'button_rstick': 'r3',
    'button_home': 'hotkey',
}

_AXISMAPPING: Final[dict[str, str]] = {
    'lstick': 'joystick1',
    'rstick': 'joystick2',
}

_HAT_DIRECTIONS: Final[dict[int, str]] = {1: 'up', 2: 'right', 4: 'down', 8: 'left'}
_LANGUAGES: Final[dict[str, int]] = {
    'en_US': 1,
    'fr_FR': 2,
    'de_DE': 3,
    'it_IT': 4,
    'es_ES': 5,
    'nl_NL': 8,
    'pt_PT': 9,
    'en_GB': 12,
}
_REGIONS: Final[dict[str, int]] = {'en_US': 1, 'ja_JP': 0}
_REGION_EUROPE: Final = 2


def _set(
    cfg: CaseSensitiveRawConfigParser, section: str, key: str, value: str | Path, /, *, default: str = 'false'
) -> None:
    """Set a key and its Qt ``\\default`` flag, creating the section if needed."""
    if not cfg.has_section(section):
        cfg.add_section(section)
    cfg.set(section, key, str(value))
    if default:
        cfg.set(section, f'{key}\\default', default)


def _bool(value: bool, /) -> str:
    return 'true' if value else 'false'


def _button(pad: Controller, key: str, port: int, /) -> str:
    if key not in pad.inputs:
        return ''
    inp = pad.inputs[key]
    prefix = 'engine:sdl'
    suffix = f'guid:{pad.guid},port:{port}'
    match inp.type:
        case 'button':
            return f'{prefix},button:{inp.id},{suffix}'
        case 'hat':
            direction = _HAT_DIRECTIONS.get(int(inp.value), 'unknown')
            return f'{prefix},hat:{inp.id},direction:{direction},{suffix}'
        case 'axis':
            return f'{prefix},threshold:0.5,axis:{inp.id},{suffix},invert:+'
        case _:
            return ''


def _axis(pad: Controller, key: str, port: int, /) -> str:
    x = pad.inputs.get(f'{key}left', '0')
    y = pad.inputs.get(f'{key}up', '0')
    return (
        'engine:sdl,range:1.000000,deadzone:0.100000,invert_y:+,invert_x:+,'
        f'offset_y:-0.000000,axis_y:{y},offset_x:-0.000000,axis_x:{x},guid:{pad.guid},port:{port}'
    )


def _write_pad_config(cfg: CaseSensitiveRawConfigParser, controllers: Controllers, /) -> None:
    for n, pad in enumerate(controllers):
        for key, value in _BUTTONMAPPING.items():
            _set(cfg, 'Controls', f'player_{n}_{key}', f'"{_button(pad, value, n)}"', default='')
        for key, value in _AXISMAPPING.items():
            _set(cfg, 'Controls', f'player_{n}_{key}', f'"{_axis(pad, value, n)}"', default='')
        _set(cfg, 'Controls', f'player_{n}_motionleft', '"[empty]"', default='')
        _set(cfg, 'Controls', f'player_{n}_motionright', '"[empty]"', default='')
        _set(cfg, 'Controls', f'player_{n}_connected', 'true')
        _set(cfg, 'Controls', f'player_{n}_vibration_enabled', 'true')


def _language_from_environment() -> int:
    return _LANGUAGES.get(os.environ.get('LANG', '')[:5], _LANGUAGES['en_US'])


def _region_from_environment() -> int:
    return _REGIONS.get(os.environ.get('LANG', '')[:5], _REGION_EUROPE)


@cached_dataclass
class Lichii(Emulator):
    needs_sdl_game_controller_config = True

    @cached_property
    def hotkeygen_context(self) -> HotkeysContext:
        return {
            'name': 'lichii',
            'keys': {'exit': ['KEY_LEFTALT', 'KEY_F4']},
        }

    @cached_property
    def config_dir(self) -> Path:
        return CONFIGS / 'lichii'

    @property
    def needs_mouse(self) -> bool:
        return True

    async def configure(self) -> Command:
        self.config_dir.mkdir(parents=True, exist_ok=True)
        _SAVES.mkdir(parents=True, exist_ok=True)
        for directory in (_ROMS, _ROMS / 'dlc', _ROMS / 'update'):
            directory.mkdir(parents=True, exist_ok=True)

        await self._write_config(self.config_dir / 'qt-config.ini')

        # Lichii keeps its data in $XDG_DATA_HOME/lichii, its settings in $XDG_CONFIG_HOME/lichii
        # and its caches in $XDG_CACHE_HOME/lichii. Keys and amiibo are shared with the other
        # Switch emulators through the paths patched in at build time.
        return Command(
            [_LICHII_BIN, '-f', '-g', self.rom],
            env={
                'XDG_CONFIG_HOME': CONFIGS,
                'XDG_DATA_HOME': _SAVES,
                'XDG_CACHE_HOME': CACHE,
                'USER': 'root',
            },
        )

    async def _write_config(self, config_file: Path, /) -> None:
        cfg = CaseSensitiveRawConfigParser()
        if config_file.exists():
            cfg.read(config_file)

        # UI: go straight into the game, with no first-run or update dialogs
        for key, value in {
            'fullscreen': 'true',
            'firstStart': 'false',
            'show_whats_new': 'false',
            'check_for_updates': 'false',
            'enable_discord_presence': 'false',
            'hideInactiveMouse': 'true',
            'Paths\\gamedirs\\1\\deep_scan': 'true',
            'Paths\\gamedirs\\1\\expanded': 'true',
        }.items():
            _set(cfg, 'UI', key, value)
        _set(cfg, 'UI', 'calloutFlags', '1')
        _set(cfg, 'UI', 'confirmStop', '2')
        _set(cfg, 'UI', 'singleWindowMode', _bool(self.config.get_bool('lichii_single_window', True)))

        # Game and external content dirs (needed to load update/dlc)
        _set(cfg, 'UI', 'Paths\\gamedirs\\1\\path', _ROMS, default='')
        _set(cfg, 'UI', 'Paths\\gamedirs\\size', '1', default='')
        _set(cfg, 'UI', 'Paths\\external_content_dirs\\size', '2', default='')
        _set(cfg, 'UI', 'Paths\\external_content_dirs\\1\\path', _ROMS / 'dlc', default='')
        _set(cfg, 'UI', 'Paths\\external_content_dirs\\2\\path', _ROMS / 'update', default='')

        # Controller shortcuts
        _set(
            cfg,
            'UI',
            'Shortcuts\\Main%20Window\\Continue\\Pause%20Emulation\\Controller_KeySeq',
            'Home+Minus',
            default='',
        )
        _set(cfg, 'UI', 'Shortcuts\\Main%20Window\\Exit%20Eglantine\\Controller_KeySeq', 'Home+Plus', default='')

        # Core
        _set(cfg, 'Core', 'use_multi_core', 'true')

        # Renderer. The fallbacks are Lichii's own defaults.
        await self._configure_backend(cfg)
        for key, option, default in (
            ('aspect_ratio', 'lichii_ratio', '0'),
            ('use_vsync', 'lichii_vsync', '2'),
            ('max_anisotropy', 'lichii_anisotropy', '0'),
            ('resolution_setup', 'lichii_scale', '3'),
            ('scaling_filter', 'lichii_scale_filter', '1'),
            ('anti_aliasing', 'lichii_aliasing_method', '0'),
            ('gpu_accuracy', 'lichii_accuracy', '1'),
        ):
            _set(cfg, 'Renderer', key, self.config.get_str(option, default))
        _set(cfg, 'Renderer', 'use_asynchronous_shaders', _bool(self.config.get_bool('lichii_async_shaders', False)))

        # System
        _set(
            cfg, 'System', 'language_index', self.config.get_str('lichii_language') or str(_language_from_environment())
        )
        _set(cfg, 'System', 'region_index', self.config.get_str('lichii_region') or str(_region_from_environment()))
        _set(cfg, 'System', 'use_docked_mode', self.config.get_str('lichii_dock_mode', '1'))
        _set(cfg, 'System', 'sound_index', self.config.get_str('lichii_sound_mode', '1'))

        # Controls
        _set(cfg, 'Controls', 'vibration_enabled', 'true')
        for n in range(len(self.controllers)):
            _set(cfg, 'Controls', f'player_{n}_type', self.config.get_str(f'p{n + 1}_pad', '0'))
        _write_pad_config(cfg, self.controllers)

        with config_file.open('w') as f:
            cfg.write(f)

    async def _configure_backend(self, cfg: CaseSensitiveRawConfigParser, /) -> None:
        backend = self.config.get_str('lichii_backend', _BACKEND_VULKAN) or _BACKEND_VULKAN
        if backend == _BACKEND_VULKAN and not await get_vulkan_info():
            # no Vulkan driver on this machine
            backend = _BACKEND_OPENGL
        _set(cfg, 'Renderer', 'backend', backend)
        # vulkan_device is left alone: Lichii sorts the devices itself, discrete GPUs first,
        # so its index 0 is not vulkaninfo's GPU0.
