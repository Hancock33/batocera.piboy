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
class Zc210(RACore):
    def set_core_options(self, core_options: LibretroConfig, /) -> None:
        # Display
        core_options.set_from_config('zc_trans_layers', default='true')

        # Audio
        core_options.set_from_config('zc_samplerate', default='44100')
        core_options.set_from_config('zc_mix_quality', default='Normal')
        core_options.set_from_config('zc_master_vol', default='16')
        core_options.set_from_config('zc_sfx_vol', default='16')
        core_options.set_from_config('zc_music_vol', default='16')
        core_options.set_from_config('zc_pan_style', default='1/2')
        core_options.set_from_config('zc_heart_beep', default='true')
        core_options.set_from_config('zc_soundfont', default='default')
        core_options.set_from_config('zc_custom_sfx', default='Off')

        # Game Options
        core_options.set_from_config('zc_allow_cheats', default='false')
