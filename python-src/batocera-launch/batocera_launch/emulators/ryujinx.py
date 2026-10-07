from __future__ import annotations

import copy
import json
import logging
import os
import shutil
from pathlib import Path
from typing import Any, Final

from batocera_common.dataclasses import cached_dataclass, cached_property
from batocera_common.paths import BIOS, CACHE, CONFIGS, ROMS, SAVES
from batocera_launch import Command, Emulator, HotkeysContext
from batocera_launch.paths import configure_emulator

_logger = logging.getLogger(__name__)

_RYUJINX_BIN: Final = Path('/usr/bin/ryujinx/Ryujinx')
_RYUJINX_KEYS: Final = BIOS / 'switch' / 'prod.keys'
_SWITCH_SAVES: Final = SAVES / 'switch'

_MAX_PLAYERS: Final = 8

# Ryujinx has no uuid derived from the evdev device here: every pad uses this id
# and is always configured as a Pro Controller.
_CONTROLLER_ID: Final = '0-00000003-28de-0000-0512-000010010000'

_LANGUAGES: Final[dict[str, int]] = {
    'jp_JP': 0,
    'en_US': 1,
    'de_DE': 2,
    'fr_FR': 3,
    'es_ES': 4,
    'it_IT': 5,
    'nl_NL': 6,
    'zh_CN': 7,
    'zh_TW': 8,
    'ko_KR': 9,
}

_CONTROLLER_TEMPLATE: Final[dict[str, Any]] = {
    'left_joycon_stick': {
        'joystick': 'Left',
        'invert_stick_x': False,
        'invert_stick_y': False,
        'rotate90_cw': False,
        'stick_button': 'LeftStick',
    },
    'right_joycon_stick': {
        'joystick': 'Right',
        'invert_stick_x': False,
        'invert_stick_y': False,
        'rotate90_cw': False,
        'stick_button': 'RightStick',
    },
    'deadzone_left': 0.1,
    'deadzone_right': 0.1,
    'range_left': 1,
    'range_right': 1,
    'trigger_threshold': 0.5,
    'motion': {
        'motion_backend': 'GamepadDriver',
        'sensitivity': 100,
        'gyro_deadzone': 1,
        'enable_motion': True,
    },
    'rumble': {
        'strong_rumble': 8,
        'weak_rumble': 2,
        'enable_rumble': True,
    },
    'led': {
        'enable_led': False,
        'turn_off_led': False,
        'use_rainbow': False,
        'led_color': 0,
    },
    'left_joycon': {
        'button_minus': 'Minus',
        'button_l': 'LeftShoulder',
        'button_zl': 'LeftTrigger',
        'button_sl': 'SingleLeftTrigger0',
        'button_sr': 'SingleRightTrigger0',
        'dpad_up': 'DpadUp',
        'dpad_down': 'DpadDown',
        'dpad_left': 'DpadLeft',
        'dpad_right': 'DpadRight',
    },
    'right_joycon': {
        'button_plus': 'Plus',
        'button_r': 'RightShoulder',
        'button_zr': 'RightTrigger',
        'button_sl': 'SingleLeftTrigger1',
        'button_sr': 'SingleRightTrigger1',
        'button_x': 'X',
        'button_b': 'B',
        'button_y': 'Y',
        'button_a': 'A',
    },
    'version': 1,
    'backend': 'GamepadSDL3',
}


def _language_from_environment() -> int:
    return _LANGUAGES.get(os.environ.get('LANG', '')[:5], _LANGUAGES['en_US'])


def _controller_config(player: int, /) -> dict[str, Any]:
    return copy.deepcopy(_CONTROLLER_TEMPLATE) | {
        'id': _CONTROLLER_ID,
        'controller_type': 'ProController',
        'player_index': f'Player{player}',
    }


@cached_dataclass
class Ryujinx(Emulator):
    needs_sdl_game_controller_config = True

    @cached_property
    def hotkeygen_context(self) -> HotkeysContext:
        return {
            'name': 'ryujinx',
            'keys': {'exit': ['KEY_LEFTALT', 'KEY_F4']},
        }

    @cached_property
    def config_dir(self) -> Path:
        return CONFIGS / 'Ryujinx'

    async def configure(self) -> Command:
        system_dir = self.config_dir / 'system'
        system_dir.mkdir(parents=True, exist_ok=True)
        _SWITCH_SAVES.mkdir(parents=True, exist_ok=True)

        # Copy the prod.keys file to where ryujinx reads it
        if _RYUJINX_KEYS.exists():
            shutil.copyfile(_RYUJINX_KEYS, system_dir / 'prod.keys')

        self._write_config(self.config_dir / 'Config.json')

        args: list[str | Path] = [_RYUJINX_BIN]
        if not configure_emulator(self.rom):
            args.append(self.rom)

        return Command(
            args,
            env={
                'XDG_CONFIG_HOME': CONFIGS,
                'XDG_DATA_HOME': _SWITCH_SAVES,
                'XDG_CACHE_HOME': CACHE,
                'SDL_JOYSTICK_HIDAPI': '0',
            },
        )

    def _write_config(self, config_file: Path, /) -> None:
        conf: dict[str, Any] = {}
        try:
            with config_file.open(encoding='utf-8') as f:
                conf = json.load(f)
        except OSError, ValueError:
            _logger.debug('No usable Ryujinx config at %s, starting fresh', config_file)

        # Defaults
        conf.update(
            enable_discord_integration=False,
            check_updates_on_start=False,
            show_confirm_exit=False,
            hide_cursor_on_idle=True,
            game_dirs=[str(ROMS / 'switch')],
            start_fullscreen=True,
            docked_mode=True,
            audio_backend='SDL3',
            audio_volume=1,
            # ryujinx app language
            language_code=str(_language_from_environment()),
            # Console language, time & date
            system_language=self.config.get_str('ryujinx_language', 'AmericanEnglish'),
            system_region=self.config.get_str('ryujinx_region', 'USA'),
            system_time_zone='UTC',
            system_time_offset=self.config.get_int('ryujinx_timeoffset', 0),
            # Graphics
            graphics_backend=self.config.get_str('ryujinx_api', 'Vulkan'),
            res_scale=self.config.get_int('ryujinx_scale', 1),
            aspect_ratio=self.config.get_str('ryujinx_ratio', 'Fixed16x9'),
            max_anisotropy=self.config.get_int('ryujinx_filtering', -1),
            # Controllers
            input_config=[
                _controller_config(player) for player, _ in enumerate(self.controllers[:_MAX_PLAYERS], start=1)
            ],
        )

        config_file.parent.mkdir(parents=True, exist_ok=True)
        with config_file.open('w', encoding='utf-8') as f:
            json.dump(conf, f, indent=2)
