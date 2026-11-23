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
from batocera_launch_libretro import AssociatedMouseMixin, RACore

if TYPE_CHECKING:
    from batocera_launch import LibretroConfig


@cached_dataclass
class Desmume(AssociatedMouseMixin, RACore):
    def set_core_options(self, core_options: LibretroConfig, /) -> None:
        # Emulate Stylus on Right Stick
        core_options.set('desmume_pointer_device_r', 'emulated')

        # Internal Resolution
        core_options.set_from_config('desmume_internal_resolution', 'internal_resolution_desmume', default='256x192')

        # Anti-aliasing (MSAA)
        multisampling = self.config.get_str('multisampling', 'disabled')
        core_options.set('desmume_gfx_multisampling', multisampling)

        # Texture Smoothing
        texture_smoothing = self.config.get_str('texture_smoothing', 'disabled')
        core_options.set('desmume_gfx_texture_smoothing', texture_smoothing)

        # MSAA and texture smoothing only apply to the OpenGL rasterizer; the core
        # falls back to the software rasterizer when no GL context is available
        core_options.set(
            'desmume_opengl_mode',
            'enabled' if multisampling != 'disabled' or texture_smoothing == 'enabled' else 'disabled',
        )

        # Textures Upscaling (XBRZ)
        core_options.set_from_config('desmume_gfx_texture_scaling', 'texture_scaling', default='1')

        # Frame Skip
        core_options.set_from_config('desmume_frameskip', 'frameskip_desmume', default='0')

        # Screen Layout
        core_options.set_from_config('desmume_screens_layout', 'screens_layout', default='top/bottom')
