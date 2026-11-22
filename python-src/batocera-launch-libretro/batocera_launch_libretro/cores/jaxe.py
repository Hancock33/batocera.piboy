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
class Jaxe(RACore):
    def set_core_options(self, core_options: LibretroConfig, /) -> None:
        # System
        core_options.set_from_config('jaxe_cpu_requency', default='1000')
        # Display
        core_options.set_from_config('jaxe_theme', default='Default')
        # Advanced Options
        core_options.set_from_config('jaxe_quirk_0_ram_init', default='enabled')
        core_options.set_from_config('jaxe_quirk_1_8xy6_8xye', default='enabled')
        core_options.set_from_config('jaxe_quirk_2_fx55_fx65', default='enabled')
        core_options.set_from_config('jaxe_quirk_3_bnnn', default='enabled')
        core_options.set_from_config('jaxe_quirk_4_big_sprite_lores', default='enabled')
        core_options.set_from_config('jaxe_quirk_5_00fe_00ff', default='enabled')
        core_options.set_from_config('jaxe_quirk_6_sprite_wrapping', default='enabled')
        core_options.set_from_config('jaxe_quirk_7_collision_enumeration', default='enabled')
        core_options.set_from_config('jaxe_quirk_8_collision_bottom_of_screen', default='enabled')
        core_options.set_from_config('jaxe_quirk_9_disable_undefined_VF_after_logical_OR_AND_XOR', default='enabled')
