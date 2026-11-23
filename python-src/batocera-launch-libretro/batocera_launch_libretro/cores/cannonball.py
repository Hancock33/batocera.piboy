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
class Cannonball(RACore):
    def set_core_options(self, core_options: LibretroConfig, /) -> None:
        # System
        core_options.set_from_config('cannonball_menu_enabled', default='ON')
        core_options.set_from_config('cannonball_freeplay', default='OFF')
        # Display
        core_options.set_from_config('cannonball_video_fps', default='Smooth (60)')
        core_options.set_from_config('cannonball_video_widescreen', default='ON')
        core_options.set_from_config('cannonball_video_hires', default='OFF')
        # Audio
        core_options.set_from_config('cannonball_sound_enable', default='ON')
        core_options.set_from_config('cannonball_sound_custom_wav_volume', default='200')
        core_options.set_from_config('cannonball_sound_advertise', default='ON')
        core_options.set_from_config('cannonball_sound_preview', default='ON')
        core_options.set_from_config('cannonball_sound_fix_samples', default='ON')
        # Controls
        core_options.set_from_config('cannonball_gear', default='Manual')
        core_options.set_from_config('cannonball_analog', default='ON')
        core_options.set_from_config('cannonball_steer_speed', default='3')
        core_options.set_from_config('cannonball_pedal_speed', default='4')
        core_options.set_from_config('cannonball_haptic_strength', default='10')
        # Game Options
        core_options.set_from_config('cannonball_jap', default='OFF')
        core_options.set_from_config('cannonball_prototype', default='OFF')
        core_options.set_from_config('cannonball_dip_time', default='Easy (80s)')
        core_options.set_from_config('cannonball_dip_traffic', default='Normal')
        core_options.set_from_config('cannonball_ttrial_laps', default='3')
        core_options.set_from_config('cannonball_ttrial_traffic', default='3')
        core_options.set_from_config('cannonball_cont_traffic', default='3')
        core_options.set_from_config('cannonball_car_color', default='RED')
        core_options.set_from_config('cannonball_grippy_tyres', default='OFF')
        core_options.set_from_config('cannonball_offroad_tyres', default='OFF')
        core_options.set_from_config('cannonball_strong_bumper', default='OFF')
        core_options.set_from_config('cannonball_faster_car', default='OFF')
        core_options.set_from_config('cannonball_force_ai', default='OFF')
        core_options.set_from_config('cannonball_new_attract', default='ON')
        core_options.set_from_config('cannonball_randomgen', default='ON')
        # Advanced Options
        core_options.set_from_config('cannonball_menu_road_scroll_speed', default='50')
        core_options.set_from_config('cannonball_level_objects', default='ON')
        core_options.set_from_config('cannonball_fix_bugs', default='ON')
        core_options.set_from_config('cannonball_fix_timer', default='OFF')
