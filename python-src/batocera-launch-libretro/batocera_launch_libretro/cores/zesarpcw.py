# This file is part of The Batocera Linux Distribution (https://batocera.org).
# Copyright (c) 2026 The Batocera Team.
#
# The Batocera Linux Distribution is free software: you can redistribute it
# and/or modify it under the terms of the GNU Lesser General Public License
# as published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# The Batocera Linux Distribution is distributed in the hope that it will be
# useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser
# General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with The Batocera Linux Distribution. If not, see
# <https://www.gnu.org/licenses/>.
#
# YOU MUST RETAIN THE LICENSE AND COPYRIGHT NOTICES ABOVE IN ANY
# REDISTRIBUTED VERSION OF THIS FILE.

from __future__ import annotations

from typing import TYPE_CHECKING

from batocera_common.dataclasses import cached_dataclass
from batocera_launch_libretro import RACore

if TYPE_CHECKING:
    from batocera_launch import LibretroConfig


@cached_dataclass
class Zesarpcw(RACore):
    def set_core_options(self, core_options: LibretroConfig, /) -> None:
        # System
        core_options.set_from_config('zesarpcw_model', default='PCW8512 (512K)')
        core_options.set_from_config('zesarpcw_cpm_autolaunch', default='enabled')

        # Display
        core_options.set_from_config('zesarpcw_phosphor', default='Green')
        core_options.set_from_config('zesarpcw_crop', default='disabled')
        core_options.set_from_config('zesarpcw_allow_videomode_change', default='enabled')
        core_options.set_from_config('zesarpcw_colour_mode', default='[0] Monochrome (native) [720x256]')
        core_options.set_from_config('zesarpcw_cga_palette', default='Green/Red/Brown')

        # Audio
        core_options.set_from_config('zesarpcw_ay_chip', default='enabled')
        core_options.set_from_config('zesarpcw_beeper', default='enabled')
        core_options.set_from_config('zesarpcw_fdc_sound', default='disabled')
        core_options.set_from_config('zesarpcw_audio_rate', default='15600 Hz (native)')

        # Controls
        core_options.set_from_config('zesarpcw_osk_button', default='Select')
        core_options.set_from_config('zesarpcw_osk_layout', default='UK')
        core_options.set_from_config('zesarpcw_osk_transparent', default='Solid - Full')
        core_options.set_from_config('zesarpcw_osk_release', default='60 ms')
