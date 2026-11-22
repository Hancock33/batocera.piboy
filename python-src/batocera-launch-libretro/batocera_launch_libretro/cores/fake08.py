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

from batocera_common.dataclasses import cached_dataclass, cached_property
from batocera_launch_libretro import Core

if TYPE_CHECKING:
    from pathlib import Path

    from batocera_launch import LibretroConfig


@cached_dataclass
class Fake08(Core):
    @cached_property
    def rom_argument(self) -> str | Path | None:
        rom = self.rom

        # Pico-8 multi-carts (might work only with official Lexaloffe engine right now)
        if rom.suffix.lower() == '.m3u':
            with rom.open() as fpin:
                lines = fpin.readlines()

            return rom.absolute().parent / lines[0].strip()

        return rom

    def set_core_options(self, core_options: LibretroConfig, /) -> None:
        # Display
        core_options.set_from_config('fake08_video_scale', default='1x')
        core_options.set_from_config('fake08_crop_h_left', default='0')
        core_options.set_from_config('fake08_crop_h_right', default='0')
        core_options.set_from_config('fake08_crop_v_top', default='0')
        core_options.set_from_config('fake08_crop_v_bottom', default='0')
