from __future__ import annotations

import copy
import json
import logging
import os
import shutil
import uuid
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

# Used when a pad's SDL GUID cannot be parsed. Every pad is configured as a Pro Controller.
_FALLBACK_GUID: Final = '00000003-28de-0000-0512-000010010000'

# Ryujinx UI locales (Config.json "language_code"), matched against $LANG.
_LANGUAGES: Final = frozenset(
    {
        'ja_JP',
        'en_US',
        'de_DE',
        'fr_FR',
        'es_ES',
        'it_IT',
        'ko_KR',
        'pt_BR',
        'ru_RU',
        'zh_CN',
        'zh_TW',
    }
)

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


def _language_from_environment() -> str:
    lang = os.environ.get('LANG', '')[:5]
    return lang if lang in _LANGUAGES else 'en_US'


def _ryujinx_guid(sdl_guid: str, /) -> str:
    """Format an SDL GUID the way Ryujinx's SDL gamepad driver does.

    Ryujinx reads the 16 GUID bytes as a .NET Guid (first three fields little-endian)
    and zeroes the first four characters, which hold SDL's unstable CRC.
    """
    try:
        guid = str(uuid.UUID(bytes_le=bytes.fromhex(sdl_guid)))
    except ValueError:
        _logger.debug('Unusable SDL GUID %r, using a fallback id', sdl_guid)
        return _FALLBACK_GUID
    return f'0000{guid[4:]}'


def _controller_ids(sdl_guids: list[str], /) -> list[str]:
    """Ryujinx ids are "<n>-<guid>", where n counts earlier pads with the same guid."""
    seen: dict[str, int] = {}
    ids: list[str] = []
    for sdl_guid in sdl_guids:
        guid = _ryujinx_guid(sdl_guid)
        index = seen.get(guid, 0)
        seen[guid] = index + 1
        ids.append(f'{index}-{guid}')
    return ids


def _controller_config(player: int, controller_id: str, /) -> dict[str, Any]:
    return copy.deepcopy(_CONTROLLER_TEMPLATE) | {
        'id': controller_id,
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
            language_code=_language_from_environment(),
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
                _controller_config(player, controller_id)
                for player, controller_id in enumerate(
                    _controller_ids([pad.guid for pad in self.controllers[:_MAX_PLAYERS]]), start=1
                )
            ],
        )

        config_file.parent.mkdir(parents=True, exist_ok=True)
        with config_file.open('w', encoding='utf-8') as f:
            json.dump(conf, f, indent=2)
