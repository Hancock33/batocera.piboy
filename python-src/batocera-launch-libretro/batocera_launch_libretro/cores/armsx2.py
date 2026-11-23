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
class Armsx2(RACore):
    def set_core_options(self, core_options: LibretroConfig, /) -> None:
        # ES keys keep the lr_ prefix so they don't clash with the standalone armsx2 emulator's armsx2_* keys.
        # System
        core_options.set_from_config('armsx2_fast_boot', 'lr_armsx2_fast_boot', default='enabled')
        core_options.set_from_config('armsx2_cheats', 'lr_armsx2_cheats', default='disabled')

        # Display
        core_options.set_from_config('armsx2_upscale', 'lr_armsx2_resolution', default='1x')
        core_options.set_from_config(
            'armsx2_texture_filtering', 'lr_armsx2_texture_filtering', default='Bilinear (PS2)'
        )
        core_options.set_from_config('armsx2_trilinear_filtering', 'lr_armsx2_trilinear_filtering', default='Automatic')
        core_options.set_from_config('armsx2_anisotropic_filtering', 'lr_armsx2_anisotropic', default='0')
        core_options.set_from_config('armsx2_dithering', 'lr_armsx2_dithering', default='Unscaled')
        core_options.set_from_config('armsx2_blending_accuracy', 'lr_armsx2_blending', default='Basic')
