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
class Craft(RACore):
    def set_core_options(self, core_options: LibretroConfig, /) -> None:
        # Display
        core_options.set_from_config('craft_resolution', default='640x480')
        core_options.set_from_config('craft_field_of_view', default='65')
        core_options.set_from_config('craft_draw_distance', default='10')
        core_options.set_from_config('craft_show_info_text', default='disabled')
        # Controls
        core_options.set_from_config('craft_inverted_aim', default='disabled')
        core_options.set_from_config('craft_analog_sensitivity', default='0.0150')
        core_options.set_from_config('craft_deadzone_radius', default='0.010')
        # Game Options
        core_options.set_from_config('craft_jumping_flash_mode', default='disabled')
