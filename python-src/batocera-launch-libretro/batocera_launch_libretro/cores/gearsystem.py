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
class Gearsystem(RACore):
    def set_core_options(self, core_options: LibretroConfig, /) -> None:
        # System
        core_options.set_from_config('gearsystem_system', default='Auto')
        core_options.set_from_config('gearsystem_region', default='Auto')
        core_options.set_from_config('gearsystem_mapper', default='Auto')
        core_options.set_from_config('gearsystem_timing', default='Auto')
        core_options.set_from_config('gearsystem_bios_sms', default='Disabled')
        core_options.set_from_config('gearsystem_bios_gg', default='Disabled')

        # Display
        core_options.set_from_config('gearsystem_aspect_ratio', default='1:1 PAR')
        core_options.set_from_config('gearsystem_overscan', default='Disabled')
        core_options.set_from_config('gearsystem_hide_left_bar', default='No')
        core_options.set_from_config('gearsystem_no_sprite_limit', default='Disabled')
        core_options.set_from_config('gearsystem_glasses', default='Both Eyes / OFF')

        # Audio
        core_options.set_from_config('gearsystem_ym2413', default='Auto')
        core_options.set_from_config('gearsystem_psg_volume', default='100')
        core_options.set_from_config('gearsystem_fm_volume', default='100')

        # Controls
        core_options.set_from_config('gearsystem_up_down_allowed', default='Disabled')
        core_options.set_from_config('gearsystem_lightgun_input', default='Light Gun')
        core_options.set_from_config('gearsystem_lightgun_crosshair', default='Disabled')
        core_options.set_from_config('gearsystem_lightgun_shape', default='Cross')
        core_options.set_from_config('gearsystem_lightgun_color', default='White')
        core_options.set_from_config('gearsystem_lightgun_crosshair_offset_x', default='0')
        core_options.set_from_config('gearsystem_lightgun_crosshair_offset_y', default='0')
        core_options.set_from_config('gearsystem_paddle_sensitivity', default='1')
        core_options.set_from_config('gearsystem_sports_pad_sensitivity', default='8')

        # Game Options
        core_options.set_from_config('gearsystem_link_enable', default='Disabled')
        core_options.set_from_config('gearsystem_link_placement', default='Horizontal')
        core_options.set_from_config('gearsystem_link_switch', default='Disabled')
        core_options.set_from_config('gearsystem_link_screen', default='Both Screens')
        core_options.set_from_config('gearsystem_link_audio', default='Screen 1')
