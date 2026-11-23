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

from typing import TYPE_CHECKING, ClassVar

from batocera_common.dataclasses import cached_dataclass
from batocera_launch_libretro import RACore, SquashFSMixin

if TYPE_CHECKING:
    from batocera_launch import LibretroConfig


@cached_dataclass
class GenesisPlusGXWide(SquashFSMixin, RACore):
    squashfs_rom_globs: ClassVar = {'megadrive-msu': ('*.md',)}

    def set_core_options(self, core_options: LibretroConfig, /) -> None:
        # System
        core_options.set_from_config('genesis_plus_gx_wide_system_hw', default='auto')
        core_options.set_from_config('genesis_plus_gx_wide_region_detect', default='auto')
        core_options.set_from_config('genesis_plus_gx_wide_vdp_mode', default='auto')
        core_options.set_from_config('genesis_plus_gx_wide_bios', default='disabled')
        core_options.set_from_config('genesis_plus_gx_wide_system_bram', default='per bios')
        core_options.set_from_config('genesis_plus_gx_wide_cart_bram', default='per cart')
        core_options.set_from_config('genesis_plus_gx_wide_cart_size', default='4meg')
        core_options.set_from_config('genesis_plus_gx_wide_add_on', default='auto')
        core_options.set_from_config('genesis_plus_gx_wide_lock_on', default='disabled')

        # Display
        core_options.set_from_config('genesis_plus_gx_wide_aspect_ratio', default='auto')
        core_options.set_from_config('genesis_plus_gx_wide_overscan', default='disabled')
        core_options.set_from_config('genesis_plus_gx_wide_h40_extra_columns', default='10')
        core_options.set_from_config('genesis_plus_gx_wide_h40_extra_columns_alpha', default='100')
        core_options.set_from_config('genesis_plus_gx_wide_left_border', default='disabled')
        core_options.set_from_config('genesis_plus_gx_wide_gg_extra', default='disabled')
        core_options.set_from_config('genesis_plus_gx_wide_blargg_ntsc_filter', default='disabled')
        core_options.set_from_config('genesis_plus_gx_wide_lcd_filter', default='disabled')
        core_options.set_from_config('genesis_plus_gx_wide_render', default='single field')
        core_options.set_from_config('genesis_plus_gx_wide_no_sprite_limit', default='disabled')
        core_options.set_from_config('genesis_plus_gx_wide_enhanced_vscroll', default='disabled')
        core_options.set_from_config('genesis_plus_gx_wide_enhanced_vscroll_limit', default='8')

        # Audio
        core_options.set_from_config('genesis_plus_gx_wide_ym2413', default='auto')
        core_options.set_from_config('genesis_plus_gx_wide_ym2413_core', default='mame')
        core_options.set_from_config('genesis_plus_gx_wide_ym2612', default='mame (ym2612)')
        core_options.set_from_config('genesis_plus_gx_wide_fm_enhance', default='off')
        core_options.set_from_config('genesis_plus_gx_wide_fm_voice_recovery', default='off')
        core_options.set_from_config('genesis_plus_gx_wide_sound_samplerate', default='auto')
        core_options.set_from_config('genesis_plus_gx_wide_sound_output', default='stereo')
        core_options.set_from_config('genesis_plus_gx_wide_audio_filter', default='disabled')
        core_options.set_from_config('genesis_plus_gx_wide_lowpass_range', default='60')
        core_options.set_from_config('genesis_plus_gx_wide_psg_preamp', default='150')
        core_options.set_from_config('genesis_plus_gx_wide_fm_preamp', default='100')
        core_options.set_from_config('genesis_plus_gx_wide_cdda_volume', default='100')
        core_options.set_from_config('genesis_plus_gx_wide_pcm_volume', default='100')
        core_options.set_from_config('genesis_plus_gx_wide_audio_eq_low', default='100')
        core_options.set_from_config('genesis_plus_gx_wide_audio_eq_mid', default='100')
        core_options.set_from_config('genesis_plus_gx_wide_audio_eq_high', default='100')

        # Controls
        core_options.set_from_config('genesis_plus_gx_wide_gun_input', default='lightgun')
        core_options.set_from_config('genesis_plus_gx_wide_gun_cursor', default='disabled')
        core_options.set_from_config('genesis_plus_gx_wide_invert_mouse', default='disabled')

        # Advanced Options
        core_options.set_from_config('genesis_plus_gx_wide_frameskip', default='disabled')
        core_options.set_from_config('genesis_plus_gx_wide_frameskip_threshold', default='33')
        core_options.set_from_config('genesis_plus_gx_wide_overclock', default='100')
        core_options.set_from_config('genesis_plus_gx_wide_force_dtack', default='enabled')
        core_options.set_from_config('genesis_plus_gx_wide_addr_error', default='enabled')
        core_options.set_from_config('genesis_plus_gx_wide_cd_latency', default='enabled')
        core_options.set_from_config('genesis_plus_gx_wide_cd_precache', default='disabled')
        core_options.set_from_config('genesis_plus_gx_wide_vdp_fix_dma_boundary_bug', default='disabled')
