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
class Eduke32(RACore):
    def set_core_options(self, core_options: LibretroConfig, /) -> None:
        # Display
        core_options.set_from_config('eduke32_resolution', default='1920x1080')
        core_options.set_from_config('eduke32_aspect_ratio', default='auto')
        # Controls
        core_options.set_from_config('eduke32_auto_aim', default='on')
        core_options.set_from_config('eduke32_always_run', default='off')
        core_options.set_from_config('eduke32_mouse_invert', default='off')
        core_options.set_from_config('eduke32_mouse_sensitivity', default='4')
        # Game Options
        core_options.set_from_config('eduke32_player_color', default='0')
