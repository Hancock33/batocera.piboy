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
class Fmsx(RACore):
    def set_core_options(self, core_options: LibretroConfig, /) -> None:
        # System
        core_options.set_from_config('fmsx_mode', default='MSX2+')
        core_options.set_from_config('fmsx_video_mode', default='NTSC')
        core_options.set_from_config('fmsx_mapper_type_mode', default='Guess')
        core_options.set_from_config('fmsx_ram_pages', default='Auto')
        core_options.set_from_config('fmsx_vram_pages', default='Auto')
        core_options.set_from_config('fmsx_scci_megaram', default='Yes')
        core_options.set_from_config('fmsx_dos2', default='No')
        core_options.set_from_config('fmsx_simbdos', default='No')
        core_options.set_from_config('fmsx_phantom_disk', default='No')
        core_options.set_from_config('fmsx_flush_disk', default='Never')
        core_options.set_from_config('fmsx_game_master', default='No')

        # Display
        core_options.set_from_config('fmsx_hires', default='Off')
        core_options.set_from_config('fmsx_overscan', default='No')
        core_options.set_from_config('fmsx_allsprites', default='No')
        core_options.set_from_config('fmsx_font', default='standard')

        # Audio
        core_options.set_from_config('fmsx_ym2413_core', default='fMSX')

        # Controls
        core_options.set_from_config('fmsx_autospace', default='No')
