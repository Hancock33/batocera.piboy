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
class Sameboy(RACore):
    def set_core_options(self, core_options: LibretroConfig, /) -> None:
        # System
        core_options.set_from_config('sameboy_model', default='Auto')
        core_options.set_from_config('sameboy_auto_sgb_model', default='Super Game Boy')
        core_options.set_from_config('sameboy_rtc', default='sync to system clock')
        # Display
        core_options.set_from_config('sameboy_mono_palette', default='greyscale')
        core_options.set_from_config('sameboy_color_correction_mode', default='emulate hardware')
        core_options.set_from_config('sameboy_light_temperature', default='0')
        core_options.set_from_config('sameboy_border', default='Super Game Boy only')
        # Audio
        core_options.set_from_config('sameboy_high_pass_filter_mode', default='accurate')
        core_options.set_from_config('sameboy_audio_interference', default='0')
        # Controls
        core_options.set_from_config('sameboy_rumble', default='rumble-enabled games')
