from __future__ import annotations

from typing import TYPE_CHECKING, Final

from batocera_common.dataclasses import cached_dataclass
from batocera_launch_libretro import RACore

if TYPE_CHECKING:
    from batocera_launch import LibretroConfig

_ZESARPCW_DEFAULTS: Final = {
    # System
    'zesarpcw_model': 'PCW8512 (512K)',
    'zesarpcw_cpm_autolaunch': 'enabled',
    # Video
    'zesarpcw_allow_videomode_change': 'enabled',
    'zesarpcw_colour_mode': '[0] Monochrome (native) [720x256]',
    'zesarpcw_phosphor': 'Green',
    'zesarpcw_cga_palette': 'Green/Red/Brown',
    'zesarpcw_crop': 'disabled',
    # Audio
    'zesarpcw_ay_chip': 'enabled',
    'zesarpcw_beeper': 'enabled',
    'zesarpcw_fdc_sound': 'disabled',
    'zesarpcw_audio_rate': '15600 Hz (native)',
    # Input
    'zesarpcw_osk_button': 'Select',
    'zesarpcw_osk_transparent': 'Solid - Full',
    'zesarpcw_osk_layout': 'UK',
    'zesarpcw_osk_release': '60 ms',
}


@cached_dataclass
class Zesarpcw(RACore):
    def set_core_options(self, core_options: LibretroConfig, /) -> None:
        for name, default in _ZESARPCW_DEFAULTS.items():
            core_options.set_from_config(name, default=default)
