from __future__ import annotations

from pathlib import Path

from batocera_common.dataclasses import cached_dataclass, cached_property
from batocera_common.paths import CONFIGS, SAVES
from batocera_launch import (
    Command,
    Emulator,
    HotkeysContext,
)


@cached_dataclass
class EDuke32(Emulator):
    needs_sdl_game_controller_config = True

    @cached_property
    def hotkeygen_context(self) -> HotkeysContext:
        return {
            'name': 'eduke32',
            'keys': {
                'exit': 'killall -9 eduke32',
                'menu': 'KEY_ESC',
                'pause': 'KEY_ESC',
                'save_state': 'KEY_F6',
                'restore_state': 'KEY_F9',
                'screenshot': 'KEY_F12',
            },
        }

    @cached_property
    def config_dir(self) -> Path:
        return CONFIGS / self.core

    @cached_property
    def saves_dir(self) -> Path:
        return SAVES / self.core

    async def configure(self) -> Command:

        args: list[str | Path] = ['eduke32']

        rtsfile = (
            self.rom.name.replace('.GRP', '.RTS')
            .replace('.grp', '.rts')
            .replace('.EDUKE', '.RTS')
            .replace('.eduke', '.rts')
        )
        if (self.rom.name.lower()).endswith('eduke'):
            edukegroup = Path(self.rom).read_text().splitlines()[0]
            edukerom = str(self.rom)
            edukerom = edukerom.replace('.eduke', '.GRP').replace('.EDUKE', '.GRP')
            args.extend([edukerom, '-game_dir', self.rom.parent, '-g', edukegroup, '-rts', rtsfile])
        else:
            args.extend([self.rom, '-game_dir', self.rom.parent, '-rts', rtsfile])

        if self.config.get_bool('nologo'):
            args.append('-nologo')

        return Command(args)
