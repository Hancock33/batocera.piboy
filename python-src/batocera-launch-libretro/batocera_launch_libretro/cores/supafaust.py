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
class Supafaust(RACore):
    def set_core_options(self, core_options: LibretroConfig, /) -> None:
        # System
        core_options.set_from_config('supafaust_region', default='auto')

        # Display
        core_options.set_from_config('supafaust_correct_aspect', default='enabled')
        core_options.set_from_config('supafaust_h_filter', default='phr256blend_auto512')
        core_options.set_from_config('supafaust_deinterlacer', default='bob_offset')
        core_options.set_from_config('supafaust_slstart', default='0')
        core_options.set_from_config('supafaust_slend', default='223')
        core_options.set_from_config('supafaust_slstartp', default='0')
        core_options.set_from_config('supafaust_slendp', default='238')

        # Audio
        core_options.set_from_config('supafaust_audio_rate', default='disabled')

        # Controls
        core_options.set_from_config('supafaust_multitap', default='disabled')

        # Advanced Options
        core_options.set_from_config('supafaust_frame_begin_vblank', default='enabled')
        core_options.set_from_config('supafaust_run_ahead', default='disabled')
        core_options.set_from_config('supafaust_pixel_format', default='rgb565')
        core_options.set_from_config('supafaust_cx4_clock_rate', default='100')
        core_options.set_from_config('supafaust_superfx_clock_rate', default='100')
        core_options.set_from_config('supafaust_superfx_icache', default='disabled')
