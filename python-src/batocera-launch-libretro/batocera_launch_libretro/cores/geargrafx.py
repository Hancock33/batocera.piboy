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
class Geargrafx(RACore):
    def set_core_options(self, core_options: LibretroConfig, /) -> None:
        # System
        core_options.set_from_config('geargrafx_console_type', default='Auto')
        core_options.set_from_config('geargrafx_backup_ram', default='Enabled')
        core_options.set_from_config('geargrafx_mb128', default='Auto')
        core_options.set_from_config('geargrafx_cdrom_type', default='Auto')
        core_options.set_from_config('geargrafx_cdrom_bios', default='System Card 3')
        core_options.set_from_config('geargrafx_cdrom_speed', default='1x')
        core_options.set_from_config('geargrafx_cdrom_fast_forward', default='Disabled')
        core_options.set_from_config('geargrafx_cdrom_fast_forward_notification', default='Enabled')

        # Display
        core_options.set_from_config('geargrafx_aspect_ratio', default='1:1 PAR')
        core_options.set_from_config('geargrafx_overscan', default='Disabled')
        core_options.set_from_config('geargrafx_scanline_count', default='240p')
        core_options.set_from_config('geargrafx_scanline_start', default='3')
        core_options.set_from_config('geargrafx_scanline_end', default='241')
        core_options.set_from_config('geargrafx_palette', default='Standard RGB')
        core_options.set_from_config('geargrafx_black_and_white', default='Enabled')
        core_options.set_from_config('geargrafx_no_sprite_limit', default='Disabled')
        core_options.set_from_config('geargrafx_lowpass_filter', default='Disabled')
        core_options.set_from_config('geargrafx_lowpass_intensity', default='100')
        core_options.set_from_config('geargrafx_lowpass_cutoff', default='5.0 MHz')
        core_options.set_from_config('geargrafx_lowpass_speed_536', default='Disabled')
        core_options.set_from_config('geargrafx_lowpass_speed_716', default='Enabled')
        core_options.set_from_config('geargrafx_lowpass_speed_108', default='Enabled')

        # Audio
        core_options.set_from_config('geargrafx_psg_huc6280a', default='Auto')
        core_options.set_from_config('geargrafx_adpcm_clock_mode', default='Auto')
        core_options.set_from_config('geargrafx_adpcm_clock_speed', default='32100')
        core_options.set_from_config('geargrafx_psg_volume', default='100')
        core_options.set_from_config('geargrafx_cdrom_volume', default='100')
        core_options.set_from_config('geargrafx_adpcm_volume', default='100')

        # Controls
        core_options.set_from_config('geargrafx_up_down_allowed', default='Disabled')
        core_options.set_from_config('geargrafx_soft_reset', default='Enabled')
        core_options.set_from_config('geargrafx_turbotap', default='Disabled')
        core_options.set_from_config('geargrafx_mouse_sensitivity', default='5')
        core_options.set_from_config('geargrafx_avenue_pad_3_switch', default='Auto')
        core_options.set_from_config('geargrafx_turbo_toggle_hotkey', default='Disabled')
        core_options.set_from_config('geargrafx_turbo_p1_i', default='Disabled')
        core_options.set_from_config('geargrafx_turbo_speed_p1_i', default='4')
        core_options.set_from_config('geargrafx_turbo_p1_ii', default='Disabled')
        core_options.set_from_config('geargrafx_turbo_speed_p1_ii', default='4')
        core_options.set_from_config('geargrafx_turbo_p2_i', default='Disabled')
        core_options.set_from_config('geargrafx_turbo_speed_p2_i', default='4')
        core_options.set_from_config('geargrafx_turbo_p2_ii', default='Disabled')
        core_options.set_from_config('geargrafx_turbo_speed_p2_ii', default='4')

        # Advanced Options
        core_options.set_from_config('geargrafx_cpu_overclock', default='100%')
        core_options.set_from_config('geargrafx_safe_vdc_defaults', default='Disabled')
        core_options.set_from_config('geargrafx_cdrom_preload', default='Disabled')
        core_options.set_from_config('geargrafx_deterministic_netplay', default='Disabled')
