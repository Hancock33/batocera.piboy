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
class BsnesJg(RACore):
    def set_core_options(self, core_options: LibretroConfig, /) -> None:
        # System
        core_options.set_from_config('bsnes_jg_hotfixes', default='off')
        core_options.set_from_config('bsnes_jg_competition_timer', default='6')
        # Display
        core_options.set_from_config('bsnes_jg_aspect', default='Auto')
        core_options.set_from_config('bsnes_jg_overscan_t', default='8')
        core_options.set_from_config('bsnes_jg_overscan_b', default='8')
        core_options.set_from_config('bsnes_jg_overscan_l', default='0')
        core_options.set_from_config('bsnes_jg_overscan_r', default='0')
        core_options.set_from_config('bsnes_jg_luminance', default='100')
        core_options.set_from_config('bsnes_jg_saturation', default='100')
        core_options.set_from_config('bsnes_jg_gamma', default='120')
        # Audio
        core_options.set_from_config('bsnes_jg_spc_interp', default='gaussian')
        core_options.set_from_config('bsnes_jg_rsqual', default='fast')
        core_options.set_from_config('bsnes_jg_low_latency_audio', default='off')
        # Advanced Options
        core_options.set_from_config('bsnes_jg_runahead', default='0')
        core_options.set_from_config('bsnes_jg_coproc_delaysync', default='off')
        core_options.set_from_config('bsnes_jg_coproc_preferhle', default='off')
