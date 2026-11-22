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
class X1(RACore):
    def set_core_options(self, core_options: LibretroConfig, /) -> None:
        # System
        core_options.set_from_config('X1_ROMTYPE', default='X1')
        core_options.set_from_config('X1_BOOTMEDIA', default='2HD')
        core_options.set_from_config('X1_CPU_CLOCK', default='4')
        core_options.set_from_config('X1_NOWAIT', default='OFF')

        # Display
        core_options.set_from_config('X1_RESOLUTE', default='LOW')
        core_options.set_from_config('X1_FPS', default='AUTO')
        core_options.set_from_config('X1_DISPSYNC', default='OFF')
        core_options.set_from_config('X1_RASTER', default='OFF')
        core_options.set_from_config('X1_SCANLINES', default='OFF')

        # Audio
        core_options.set_from_config('X1_FMBOARD', default='ON')
        core_options.set_from_config('X1_SEEKSND', default='OFF')
        core_options.set_from_config('X1_AUDIO_RATE', default='44100')

        # Controls
        core_options.set_from_config('X1_KEY_MODE', default='Keyboard')
        core_options.set_from_config('X1_BTN_MODE', default='OFF')
        core_options.set_from_config('X1_BTN_RAPID', default='OFF')

        # Advanced Options
        core_options.set_from_config('X1_AUDIO_DELAYMS', default='250')
