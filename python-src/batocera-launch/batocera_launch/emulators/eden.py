from __future__ import annotations

import logging
from os import environ
from typing import TYPE_CHECKING, Final

from batocera_common.configparser import CaseSensitiveConfigParser
from batocera_common.dataclasses import cached_dataclass, cached_property
from batocera_common.paths import CACHE, CONFIGS, ROMS, SAVES
from batocera_launch import Command, Emulator, HotkeysContext
from batocera_launch.utils import vulkan

if TYPE_CHECKING:
    from collections.abc import Mapping
    from pathlib import Path

    from batocera_launch.controller import Controller
    from batocera_launch.input import InputMapping

_logger = logging.getLogger(__name__)

EDEN_CONFIG: Final = CONFIGS / 'yuzu'

_SWITCH_ROMS: Final = ROMS / 'switch'

_LANGUAGES: Final = {
    'en_US': 1,
    'fr_FR': 2,
    'de_DE': 3,
    'it_IT': 4,
    'es_ES': 5,
    'nl_NL': 8,
    'pt_PT': 9,
}

_REGIONS: Final = {
    'en_US': 1,
    'ja_JP': 0,
}

_EUROPE_REGION: Final = 2

_HAT_DIRECTIONS: Final = {1: 'up', 2: 'right', 4: 'down', 8: 'left'}

_BUTTON_BINDINGS: Final = {
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

_AXIS_BINDINGS: Final = {
    'lstick': 'joystick1',
    'rstick': 'joystick2',
}

_AXIS_INPUTS: Final[Mapping[str, tuple[str, str]]] = {
    'joystick1': ('joystick1left', 'joystick1up'),
    'joystick2': ('joystick2left', 'joystick2up'),
}


def _language() -> int:
    return _LANGUAGES.get(environ['LANG'][:5], _LANGUAGES['en_US'])


def _region() -> int:
    return _REGIONS.get(environ['LANG'][:5], _EUROPE_REGION)


def _set(settings: CaseSensitiveConfigParser, section: str, key: str, value: str, /, *, default: str = 'false') -> None:
    """Set a Qt-style option together with its companion '<key>\\default' flag."""
    settings.set(section, key, value)
    settings.set(section, f'{key}\\default', default)


def _button_binding(key: str, pad: Controller, port: int, /) -> str:
    # it would be better to pass the joystick num instead of the guid because 2 joysticks may have the same guid
    if (pad_input := pad.inputs.get(key)) is None:
        return ''

    match pad_input.type:
        case 'button':
            return f'engine:sdl,button:{pad_input.id},guid:{pad.guid},port:{port}'
        case 'hat':
            direction = _HAT_DIRECTIONS.get(int(pad_input.value), 'unknown')
            return f'engine:sdl,hat:{pad_input.id},direction:{direction},guid:{pad.guid},port:{port}'
        case 'axis':
            return f'engine:sdl,threshold:0.5,axis:{pad_input.id},guid:{pad.guid},port:{port},invert:+'
        case _:
            return ''


def _axis_binding(key: str, pad: Controller, port: int, /) -> str:
    inputs: InputMapping = pad.inputs
    left_key, up_key = _AXIS_INPUTS[key]

    inputx = inputs.get(left_key, '0')
    inputy = inputs.get(up_key, '0')

    return (
        'engine:sdl,range:1.000000,deadzone:0.100000,invert_y:+,invert_x:+,'
        f'offset_y:-0.000000,axis_y:{inputy},offset_x:-0.000000,axis_x:{inputx},guid:{pad.guid},port:{port}'
    )


@cached_dataclass
class Eden(Emulator):
    @cached_property
    def hotkeygen_context(self) -> HotkeysContext:
        return {
            'name': 'eden',
            'keys': {'exit': ['KEY_LEFTALT', 'KEY_F4']},
        }

    def _write_settings(self) -> None:
        settings = CaseSensitiveConfigParser(interpolation=None)
        settings_path = EDEN_CONFIG / 'qt-config.ini'
        if settings_path.exists():
            settings.read(settings_path)

        for section in (
            'UI',
            'Data%20Storage',
            'Core',
            'Renderer',
            'Cpu',
            'System',
            'Controls',
            'WebService',
            'Services',
        ):
            if not settings.has_section(section):
                settings.add_section(section)

        ## [UI]
        _set(settings, 'UI', 'fullscreen', 'true', default='true')
        _set(settings, 'UI', 'confirmClose', 'false', default='false')
        _set(settings, 'UI', 'firstStart', 'false', default='false')
        _set(settings, 'UI', 'displayTitleBars', 'false', default='false')
        _set(settings, 'UI', 'enable_discord_presence', 'false', default='false')
        _set(settings, 'UI', 'calloutFlags', '1')
        _set(settings, 'UI', 'confirmStop', '2')
        _set(settings, 'UI', 'singleWindowMode', self.config.get('eden_single_window', 'true'))
        _set(settings, 'UI', 'hideInactiveMouse', 'true')

        # Roms path (needed to load updates/DLC)
        _set(settings, 'UI', 'Paths\\gamedirs\\1\\deep_scan', 'true')
        _set(settings, 'UI', 'Paths\\gamedirs\\1\\expanded', 'true')
        settings.set('UI', 'Paths\\gamedirs\\1\\path', str(_SWITCH_ROMS))
        settings.set('UI', 'Paths\\gamedirs\\size', '1')
        settings.set('UI', 'Paths\\external_content_dirs\\size', '2')
        settings.set('UI', 'Paths\\external_content_dirs\\1\\path', str(_SWITCH_ROMS / 'dlc'))
        settings.set('UI', 'Paths\\external_content_dirs\\2\\path', str(_SWITCH_ROMS / 'update'))

        _set(settings, 'UI', 'Screenshots\\enable_screenshot_save_as', 'true')
        _set(settings, 'UI', 'Screenshots\\screenshot_path', '/userdata/screenshots')

        # Change controller exit
        settings.set('UI', 'Shortcuts\\Main%20Window\\Continue\\Pause%20Emulation\\Controller_KeySeq', 'Home+Minus')
        settings.set('UI', 'Shortcuts\\Main%20Window\\Exit%20eden\\Controller_KeySeq', 'Home+Plus')

        ## [Data%20Storage]
        for name in ('dump', 'load', 'nand', 'sdmc', 'tas'):
            _set(settings, 'Data%20Storage', f'{name}_directory', str(EDEN_CONFIG.parent / 'eden' / name))
        _set(settings, 'Data%20Storage', 'use_virtual_sd', 'true')

        ## [Core]
        _set(settings, 'Core', 'use_multi_core', 'true')

        ## [Renderer]
        _set(settings, 'Renderer', 'aspect_ratio', self.config.get('eden_ratio', '0'))
        self._write_backend(settings)
        _set(settings, 'Renderer', 'use_asynchronous_shaders', self.config.get('eden_async_shaders', 'true'))
        _set(settings, 'Renderer', 'shader_backend', self.config.get('eden_shaderbackend', '0'))
        _set(settings, 'Renderer', 'use_asynchronous_gpu_emulation', self.config.get('eden_async_gpu', 'true'))
        _set(settings, 'Renderer', 'nvdec_emulation', self.config.get('eden_nvdec_emu', '2'))
        _set(settings, 'Renderer', 'gpu_accuracy', self.config.get('eden_accuracy', '0'), default='true')
        _set(settings, 'Renderer', 'use_vsync', self.config.get('eden_vsync', '1'))
        _set(settings, 'Renderer', 'max_anisotropy', self.config.get('eden_anisotropy', '0'))
        _set(settings, 'Renderer', 'resolution_setup', self.config.get('eden_scale', '2'))
        _set(settings, 'Renderer', 'scaling_filter', self.config.get('eden_scale_filter', '1'))
        _set(settings, 'Renderer', 'anti_aliasing', self.config.get('eden_aliasing_method', '0'))

        ## [Cpu]
        _set(settings, 'Cpu', 'cpu_accuracy', self.config.get('eden_cpuaccuracy', '0'))

        ## [System]
        _set(settings, 'System', 'language_index', self.config.get('eden_language') or str(_language()))
        _set(settings, 'System', 'region_index', self.config.get('eden_region') or str(_region()))

        ## [Controls]
        _set(settings, 'Controls', 'use_docked_mode', self.config.get('eden_dock_mode', 'true'))
        _set(settings, 'Controls', 'sound_index', self.config.get('eden_sound_mode', '1'))
        _set(settings, 'Controls', 'time_zone_index', self.config.get('eden_timezone', '0'))
        _set(settings, 'Controls', 'vibration_enabled', 'true')

        self._write_pads(settings)

        ## [WebService]
        _set(settings, 'WebService', 'enable_telemetry', 'false', default='false')

        ## [Services]
        _set(settings, 'Services', 'bcat_backend', 'none', default='none')

        settings_path.parent.mkdir(parents=True, exist_ok=True)
        with settings_path.open('w') as config_file:
            settings.write(config_file)

    def _write_backend(self, settings: CaseSensitiveConfigParser, /) -> None:
        backend = self.config.get_str('eden_backend')

        if not backend:
            _set(settings, 'Renderer', 'backend', '0')
            return

        _set(settings, 'Renderer', 'backend', backend)

        # Vulkan device selection
        if backend != '1' or not vulkan.is_available():
            return

        _logger.debug('Vulkan driver is available on the system.')

        vulkan_device = '0'

        if vulkan.has_discrete_gpu():
            _logger.debug('A discrete GPU is available on the system. We will use that for performance')

            if discrete_index := vulkan.get_discrete_gpu_index():
                _logger.debug('Using Discrete GPU Index: %s for Eden', discrete_index)
                vulkan_device = discrete_index
            else:
                _logger.debug("Couldn't get discrete GPU index, using default")
        else:
            _logger.debug('Discrete GPU is not available on the system. Using default.')

        _set(settings, 'Renderer', 'vulkan_device', vulkan_device, default='true')

    def _write_pads(self, settings: CaseSensitiveConfigParser, /) -> None:
        for player, pad in enumerate(self.controllers):
            _set(settings, 'Controls', f'player_{player}_type', self.config.get(f'p{player + 1}_pad', '0'))

            for option, binding in _BUTTON_BINDINGS.items():
                settings.set('Controls', f'player_{player}_{option}', f'"{_button_binding(binding, pad, player)}"')

            for option, binding in _AXIS_BINDINGS.items():
                settings.set('Controls', f'player_{player}_{option}', f'"{_axis_binding(binding, pad, player)}"')

            settings.set('Controls', f'player_{player}_motionleft', '"[empty]"')
            settings.set('Controls', f'player_{player}_motionright', '"[empty]"')
            _set(settings, 'Controls', f'player_{player}_connected', 'true')
            _set(settings, 'Controls', f'player_{player}_vibration_enabled', 'true')

        for player in range(len(self.controllers), 9):
            _set(settings, 'Controls', f'player_{player - 1}_connected', 'true')

    async def configure(self) -> Command:
        for directory in (EDEN_CONFIG, _SWITCH_ROMS, _SWITCH_ROMS / 'dlc', _SWITCH_ROMS / 'update'):
            directory.mkdir(parents=True, exist_ok=True)

        self._write_settings()

        args: list[str | Path] = ['/usr/bin/eden', '-f', '-g', self.rom]

        env: dict[str, str | Path] = {
            'XDG_CONFIG_HOME': CONFIGS,
            'XDG_DATA_HOME': SAVES / 'switch',
            'XDG_CACHE_HOME': CACHE,
            'USER': 'root',
        }

        return Command(args, env=env)
