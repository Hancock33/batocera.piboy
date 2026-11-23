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

from .tgbdual import TGBDual

if TYPE_CHECKING:
    from batocera_launch import LibretroConfig


# Reuses the TGB Dual link handling: .gb2/.gbc2 lists load through the
# gb_link_2p subsystem and sync_saves copies the saves in and out
@cached_dataclass
class DoubleCherryGB(TGBDual):
    def set_core_options(self, core_options: LibretroConfig, /) -> None:
        # System
        # Two linked Game Boys for the 2 player systems (the gb_link_2p
        # subsystem sets 2 itself), one otherwise. Written on every launch
        # because the core saves the count when a player hot-joins with L1.
        core_options.set('dcgb_emulated_gameboys', '2' if self.system in {'gb2players', 'gbc2players'} else '1')
