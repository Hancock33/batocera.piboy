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

from ._hatari_core import HatariConfigMixin

if TYPE_CHECKING:
    from batocera_launch import LibretroConfig


@cached_dataclass
class Hatari(HatariConfigMixin, Core):
    def set_core_options(self, core_options: LibretroConfig, /) -> None:
        # System
        core_options.set_from_config('hatari_machinetype', default='st')
        core_options.set_from_config('hatari_memory_size', default='1024')
        core_options.set_from_config('hatari_ttram_size', default='0')
        core_options.set_from_config('hatari_cpu_level', default='0')
        core_options.set_from_config('hatari_cpu_clock', default='8')
        core_options.set_from_config('hatari_fpu_type', default='none')
        core_options.set_from_config('hatari_dsp_type', default='none')
        core_options.set_from_config('hatari_blitter', default='disabled')
        core_options.set_from_config('hatari_fastboot', default='disabled')
        core_options.set_from_config('hatari_patch_tos', default='enabled')
        core_options.set_from_config('hatari_auto_insert_disk_b', default='enabled')
        core_options.set_from_config('hatari_fast_floppy', default='disabled')
        core_options.set_from_config('hatari_floppy_write_protection', default='off')
        # Display
        core_options.set_from_config('hatari_monitor_type', default='rgb')
        core_options.set_from_config('hatari_borders', default='disabled')
        core_options.set_from_config('hatari_aspect_correct', default='enabled')
        core_options.set_from_config('hatari_drive_leds', default='enabled')
        core_options.set_from_config('hatari_spec512_threshold', default='1')
        # Audio
        core_options.set_from_config('hatari_floppy_sound', default='enabled')
        core_options.set_from_config('hatari_floppy_sound_volume', default='75')
        # Controls
        core_options.set_from_config('hatari_joystick_port0', default='none')
        core_options.set_from_config('hatari_joystick_port1', default='real')
        core_options.set_from_config('hatari_joystick_autofire', default='disabled')
        core_options.set_from_config('hatari_joystick_jump_fire2', default='enabled')
        core_options.set_from_config('hatari_vkbd', default='enabled')
        core_options.set_from_config('hatari_vkbd_button', default='x')
        core_options.set_from_config('hatari_vkbd_theme', default='beige')
        # Advanced Options
        core_options.set_from_config('hatari_timerd', default='disabled')
        core_options.set_from_config('hatari_cpu_compatible', default='enabled')
        core_options.set_from_config('hatari_cpu_cycle_exact', default='enabled')
        core_options.set_from_config('hatari_cpu_data_cache', default='enabled')
        core_options.set_from_config('hatari_cpu_addr24', default='enabled')
        core_options.set_from_config('hatari_fpu_softfloat', default='disabled')
        core_options.set_from_config('hatari_mmu', default='disabled')
        core_options.set_from_config('hatari_video_timing', default='ws3')
        core_options.set_from_config('hatari_drive_a_enable', default='enabled')
        core_options.set_from_config('hatari_drive_a_heads', default='2')
        core_options.set_from_config('hatari_drive_b_enable', default='enabled')
        core_options.set_from_config('hatari_drive_b_heads', default='2')
