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

_EDEN_BIN: Final = Path('/usr/bin/eden')
_ROMS: Final = Path('/userdata/roms/switch')
_DATA: Final = CONFIGS / 'eden'
_SAVES: Final = SAVES / 'switch'

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
    'button_sl': 'l',
    'button_sr': 'r',
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
    # Ideally the joystick index would be used instead of the guid, as two pads may share a guid.
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

    # Preserved from the original generator: marks the remaining slots as connected.
    for y in range(len(controllers), 9):
        _set(cfg, 'Controls', f'player_{y - 1}_connected', 'true')


def _language_from_environment() -> int:
    return _LANGUAGES.get(os.environ.get('LANG', '')[:5], _LANGUAGES['en_US'])


def _region_from_environment() -> int:
    return _REGIONS.get(os.environ.get('LANG', '')[:5], _REGION_EUROPE)


@cached_dataclass
class Eden(Emulator):
    needs_sdl_game_controller_config = True

    @cached_property
    def hotkeygen_context(self) -> HotkeysContext:
        return {
            'name': 'eden',
            'keys': {'exit': ['KEY_LEFTALT', 'KEY_F4']},
        }

    @cached_property
    def config_dir(self) -> Path:
        return CONFIGS / 'yuzu'

    @property
    def needs_mouse(self) -> bool:
        return True

    async def configure(self) -> Command:
        self.config_dir.mkdir(parents=True, exist_ok=True)
        _SAVES.mkdir(parents=True, exist_ok=True)
        for directory in (_ROMS, _ROMS / 'dlc', _ROMS / 'update'):
            directory.mkdir(parents=True, exist_ok=True)

        await self._write_config(self.config_dir / 'qt-config.ini')

        return Command(
            [_EDEN_BIN, '-f', '-g', self.rom],
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

        # UI
        for key, value in {
            'fullscreen': 'true',
            'confirmClose': 'false',
            'firstStart': 'false',
            'displayTitleBars': 'false',
            'enable_discord_presence': 'false',
            'hideInactiveMouse': 'true',
            'Screenshots\\enable_screenshot_save_as': 'true',
            'Screenshots\\screenshot_path': '/userdata/screenshots',
            'Paths\\gamedirs\\1\\deep_scan': 'true',
            'Paths\\gamedirs\\1\\expanded': 'true',
        }.items():
            _set(cfg, 'UI', key, value)
        _set(cfg, 'UI', 'calloutFlags', '1')
        _set(cfg, 'UI', 'confirmStop', '2')
        _set(cfg, 'UI', 'singleWindowMode', _bool(self.config.get_bool('eden_single_window', True)))

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
        _set(cfg, 'UI', 'Shortcuts\\Main%20Window\\Exit%20eden\\Controller_KeySeq', 'Home+Plus', default='')

        # Data storage
        for name in ('dump', 'load', 'nand', 'sdmc', 'tas'):
            _set(cfg, 'Data%20Storage', f'{name}_directory', _DATA / name)
        _set(cfg, 'Data%20Storage', 'use_virtual_sd', 'true')

        # Core / CPU
        _set(cfg, 'Core', 'use_multi_core', 'true')
        _set(cfg, 'Cpu', 'cpu_accuracy', self.config.get_str('eden_cpuaccuracy', '0'))

        # Renderer
        await self._configure_backend(cfg)
        for key, option, default in (
            ('aspect_ratio', 'eden_ratio', '0'),
            ('shader_backend', 'eden_shaderbackend', '0'),
            ('nvdec_emulation', 'eden_nvdec_emu', '2'),
            ('use_vsync', 'eden_vsync', '1'),
            ('max_anisotropy', 'eden_anisotropy', '0'),
            ('resolution_setup', 'eden_scale', '2'),
            ('scaling_filter', 'eden_scale_filter', '1'),
            ('anti_aliasing', 'eden_aliasing_method', '0'),
        ):
            _set(cfg, 'Renderer', key, self.config.get_str(option, default))
        _set(cfg, 'Renderer', 'use_asynchronous_shaders', _bool(self.config.get_bool('eden_async_shaders', True)))
        _set(cfg, 'Renderer', 'use_asynchronous_gpu_emulation', _bool(self.config.get_bool('eden_async_gpu', True)))
        _set(cfg, 'Renderer', 'gpu_accuracy', self.config.get_str('eden_accuracy', '0'), default='true')

        # System
        _set(cfg, 'System', 'language_index', self.config.get_str('eden_language') or str(_language_from_environment()))
        _set(cfg, 'System', 'region_index', self.config.get_str('eden_region') or str(_region_from_environment()))

        # Controls
        _set(cfg, 'Controls', 'use_docked_mode', _bool(self.config.get_bool('eden_dock_mode', True)))
        _set(cfg, 'Controls', 'sound_index', self.config.get_str('eden_sound_mode', '1'))
        _set(cfg, 'Controls', 'time_zone_index', self.config.get_str('eden_timezone', '0'))
        _set(cfg, 'Controls', 'vibration_enabled', 'true')
        for n in range(len(self.controllers)):
            _set(cfg, 'Controls', f'player_{n}_type', self.config.get_str(f'p{n + 1}_pad', '0'))
        _write_pad_config(cfg, self.controllers)

        # Telemetry / services
        _set(cfg, 'WebService', 'enable_telemetry', 'false')
        _set(cfg, 'Services', 'bcat_backend', 'none', default='none')

        with config_file.open('w') as f:
            cfg.write(f)

    async def _configure_backend(self, cfg: CaseSensitiveRawConfigParser, /) -> None:
        backend = self.config.get_str('eden_backend', '0') or '0'
        _set(cfg, 'Renderer', 'backend', backend)

        if backend != '1' or not (vulkan_info := await get_vulkan_info()):
            return

        # NOTE: adjust to the real attributes exposed by get_vulkan_info()
        device = '0'
        if getattr(vulkan_info, 'has_discrete_gpu', False):
            device = str(getattr(vulkan_info, 'discrete_gpu_index', None) or 0)
        _set(cfg, 'Renderer', 'vulkan_device', device, default='true')
