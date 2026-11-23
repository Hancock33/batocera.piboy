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
from batocera_launch_libretro import Core

if TYPE_CHECKING:
    from batocera_launch import LibretroConfig


@cached_dataclass
class BennuGD(Core):
    @property
    def disables_bezel(self) -> bool:
        return True

    def set_core_options(self, core_options: LibretroConfig, /) -> None:
        # Display
        core_options.set_from_config('bennugd_override_scaling', default='off')
        # Controls
        core_options.set_from_config('bennugd_mouse_emulation', default='off')
        core_options.set_from_config('bennugd_mouse_emulation_dead_zone', default='10')
        core_options.set_from_config('bennugd_mouse_emulation_scale', default='20')
        # Advanced Options
        core_options.set_from_config('bennugd_force_frame_limiter', default='false')
        core_options.set_from_config('bennugd_case_insensitive_file_io', default='true')
