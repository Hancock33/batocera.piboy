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
class Gpsp(RACore):
    def set_core_options(self, core_options: LibretroConfig, /) -> None:
        # System
        core_options.set_from_config('gpsp_bios', default='auto')
        core_options.set_from_config('gpsp_boot_mode', default='game')
        core_options.set_from_config('gpsp_rtc', default='auto')
        core_options.set_from_config('gpsp_rtc_time_source', default='deterministic')
        core_options.set_from_config('gpsp_serial', default='auto')
        # Display
        core_options.set_from_config('gpsp_color_correction', default='disabled')
        core_options.set_from_config('gpsp_frame_mixing', default='disabled')
        core_options.set_from_config('gpsp_sprlim', default='disabled')
        # Audio
        core_options.set_from_config('gpsp_sound_rate', default='32768')
        # Controls
        core_options.set_from_config('gpsp_rumble', default='auto')
        core_options.set_from_config('gpsp_turbo_period', default='4')
        # Advanced Options
        core_options.set_from_config('gpsp_drc', default='enabled')
        core_options.set_from_config('gpsp_frameskip', default='disabled')
        core_options.set_from_config('gpsp_frameskip_threshold', default='33')
        core_options.set_from_config('gpsp_frameskip_interval', default='1')
