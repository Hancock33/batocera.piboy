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
class Amiberry(RACore):
    def set_core_options(self, core_options: LibretroConfig, /) -> None:
        # System
        core_options.set_from_config('amiberry_cpu_model', default='auto')
        core_options.set_from_config('amiberry_chipset', default='auto')
        core_options.set_from_config('amiberry_chipset_aga', default='auto')
        core_options.set_from_config('amiberry_floppy_speed', default='100')
        # Display
        core_options.set_from_config('amiberry_video_standard', default='auto')
        core_options.set_from_config('amiberry_crop_overscan', default='disabled')
        core_options.set_from_config('amiberry_internal_vsync', default='disabled')
        core_options.set_from_config('amiberry_statusline', default='disabled')
        core_options.set_from_config('amiberry_statusline_size', default='1x')
        # Audio
        core_options.set_from_config('amiberry_audio_rate', default='auto')
        core_options.set_from_config('amiberry_audio_interpolation', default='auto')
        core_options.set_from_config('amiberry_sound_filter', default='off')
        core_options.set_from_config('amiberry_stereo_separation', default='7')
        core_options.set_from_config('amiberry_midi_output', default='disabled')
        # Controls
        core_options.set_from_config('amiberry_port0_device', default='mouse')
        core_options.set_from_config('amiberry_port1_device', default='joystick')
        core_options.set_from_config('amiberry_swap_ports', default='disabled')
        core_options.set_from_config('amiberry_joyport_order', default='auto')
        core_options.set_from_config('amiberry_analog', default='enabled')
        core_options.set_from_config('amiberry_joy_deadzone', default='33')
        core_options.set_from_config('amiberry_analog_sensitivity', default='18')
        core_options.set_from_config('amiberry_joy_as_mouse', default='disabled')
        core_options.set_from_config('amiberry_on_screen_keyboard', default='disabled')
