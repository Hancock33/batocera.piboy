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
class Ecwolf(RACore):
    def set_core_options(self, core_options: LibretroConfig, /) -> None:
        # Display
        core_options.set_from_config('ecwolf-resolution', default='320x200')
        core_options.set_from_config('ecwolf-fps', default='35')
        core_options.set_from_config('ecwolf-aspect', default='auto')
        core_options.set_from_config('ecwolf-viewsize', default='20')
        core_options.set_from_config('ecwolf-palette', default='rgb565')
        # Audio
        core_options.set_from_config('ecwolf-music-volume', default='20')
        core_options.set_from_config('ecwolf-digi-volume', default='20')
        core_options.set_from_config('ecwolf-adlib-volume', default='20')
        core_options.set_from_config('ecwolf-speaker-volume', default='20')
        core_options.set_from_config('ecwolf-effects-priority', default='digi-adlib-speaker')
        # Controls
        core_options.set_from_config('ecwolf-alwaysrun', default='disabled')
        core_options.set_from_config('ecwolf-analog-deadzone', default='15%')
        core_options.set_from_config('ecwolf-analog-move-sensitivity', default='20')
        core_options.set_from_config('ecwolf-analog-turn-sensitivity', default='20')
        core_options.set_from_config('ecwolf-mouse-turn-sensitivity', default='10')
        # Game Options
        core_options.set_from_config('ecwolf-am-overlay', default='off')
        core_options.set_from_config('ecwolf-am-rotate', default='off')
        core_options.set_from_config('ecwolf-am-drawtexturedwalls', default='enabled')
        core_options.set_from_config('ecwolf-am-drawtexturedfloors', default='disabled')
        core_options.set_from_config('ecwolf-am-texturedoverlay', default='disabled')
        core_options.set_from_config('ecwolf-am-showratios', default='disabled')
        core_options.set_from_config('ecwolf-am-pause', default='enabled')
        core_options.set_from_config('ecwolf-panx-adjustment', default='5')
        core_options.set_from_config('ecwolf-pany-adjustment', default='5')
        core_options.set_from_config('ecwolf-invulnerability', default='disabled')
        # Advanced Options
        core_options.set_from_config('ecwolf-memstore', default='disabled')
        core_options.set_from_config('ecwolf-preload-digisounds', default='enabled')
