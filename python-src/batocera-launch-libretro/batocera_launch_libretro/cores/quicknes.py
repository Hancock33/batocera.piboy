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
class Quicknes(RACore):
    def set_core_options(self, core_options: LibretroConfig, /) -> None:
        # Display
        core_options.set_from_config('quicknes_aspect_ratio_par', default='PAR')
        core_options.set_from_config('quicknes_use_overscan_h', default='enabled')
        core_options.set_from_config('quicknes_use_overscan_v', default='disabled')
        core_options.set_from_config('quicknes_palette', default='default')
        core_options.set_from_config('quicknes_no_sprite_limit', default='disabled')
        # Audio
        core_options.set_from_config('quicknes_audio_samplerate', default='auto')
        core_options.set_from_config('quicknes_audio_nonlinear', default='nonlinear')
        core_options.set_from_config('quicknes_audio_eq', default='default')
        # Controls
        core_options.set_from_config('quicknes_turbo_enable', default='none')
        core_options.set_from_config('quicknes_turbo_pulse_width', default='3')
        core_options.set_from_config('quicknes_up_down_allowed', default='disabled')
