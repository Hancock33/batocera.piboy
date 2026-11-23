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
class Supermodel(RACore):
    def set_core_options(self, core_options: LibretroConfig, /) -> None:
        # System
        core_options.set_from_config('supermodel_initial_nvram_setup', default='enabled')

        # Display
        core_options.set_from_config('supermodel_resolution', default='native')
        core_options.set_from_config('supermodel_upscale_mode', default='2')
        core_options.set_from_config('supermodel_renderer_3d', default='new3d')
        core_options.set_from_config('supermodel_crt_colors', default='0')
        core_options.set_from_config('supermodel_supersampling', default='1')
        core_options.set_from_config('supermodel_aspect_ratio', default='auto')
        core_options.set_from_config('supermodel_wide_screen', default='disabled')
        core_options.set_from_config('supermodel_no_white_flash', default='disabled')
        core_options.set_from_config('supermodel_av_timing', default='60hz')
        core_options.set_from_config('supermodel_crosshairs', default='auto')

        # Audio
        core_options.set_from_config('supermodel_sound_enable', default='enabled')
        core_options.set_from_config('supermodel_sound_volume', default='100')
        core_options.set_from_config('supermodel_music_volume', default='100')
        core_options.set_from_config('supermodel_scsp_dsp', default='new')

        # Controls
        core_options.set_from_config('supermodel_service_buttons', default='sticks')
        core_options.set_from_config('supermodel_driving_layout', default='triggers_hgate')
        core_options.set_from_config('supermodel_steering_response', default='linear')
        core_options.set_from_config('supermodel_steering_output_range', default='100')
        core_options.set_from_config('supermodel_accelerator_output_range', default='100')
        core_options.set_from_config('supermodel_brake_output_range', default='100')
        core_options.set_from_config('supermodel_force_feedback', default='enabled')
        core_options.set_from_config('supermodel_gun_input', default='hybrid')
        core_options.set_from_config('supermodel_offscreen_reload_shortcut', default='enabled')
        core_options.set_from_config('supermodel_mouse_edge_offscreen_reload', default='disabled')
        core_options.set_from_config('supermodel_star_wars_input', default='hybrid')
        core_options.set_from_config('supermodel_star_wars_upright_x_inversion', default='enabled')

        # Advanced Options
        core_options.set_from_config('supermodel_frameskip', default='0')
        core_options.set_from_config('supermodel_ppc_frequency', default='auto')
        core_options.set_from_config('supermodel_emulation_threading', default='multi_gpu')
        core_options.set_from_config('supermodel_jit_enable', default='enabled')
        core_options.set_from_config('supermodel_quad_rendering', default='disabled')
        core_options.set_from_config('supermodel_legacy_multi_texture', default='disabled')
