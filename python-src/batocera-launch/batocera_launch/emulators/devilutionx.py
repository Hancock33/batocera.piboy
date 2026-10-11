from __future__ import annotations

import shutil
from pathlib import Path
from typing import Final

from batocera_common.configparser import CaseSensitiveRawConfigParser
from batocera_common.dataclasses import cached_dataclass, cached_property
from batocera_common.paths import ROMS
from batocera_launch import Command, Emulator, HotkeysContext

_DEVILUTIONX_BIN: Final = Path('/usr/bin/diablo/devilutionx')
_MPQ_SRC: Final = Path('/usr/share/diasurgical/devilutionx')
_DATA_DIR: Final = ROMS / 'ports' / 'devilutionx'


def _set(cfg: CaseSensitiveRawConfigParser, section: str, key: str, value: str | Path, /) -> None:
    """Set a key, creating the section if needed."""
    if not cfg.has_section(section):
        cfg.add_section(section)
    cfg.set(section, key, str(value))


@cached_dataclass
class DevilutionX(Emulator):
    needs_sdl_game_controller_config = True

    @cached_property
    def hotkeygen_context(self) -> HotkeysContext:
        return {
            'name': 'devilutionx',
            'keys': {
                'exit': ['KEY_LEFTALT', 'KEY_F4'],
                'menu': 'KEY_ESC',
                'pause': 'KEY_ESC',
                'save_state': 'KEY_F2',
                'restore_state': 'KEY_F3',
            },
        }

    @cached_property
    def in_game_ratio(self) -> float:
        return 16 / 9 if self.config.get_bool('devilutionx_stretch') else 4 / 3

    async def configure(self) -> Command:
        # Copy the latest devilutionx.mpq to the rom dir
        shutil.copytree(_MPQ_SRC, _DATA_DIR, dirs_exist_ok=True)

        self.config_dir.mkdir(parents=True, exist_ok=True)
        self.saves_dir.mkdir(parents=True, exist_ok=True)

        await self._write_config(self.config_dir / 'diablo.ini')

        args: list[str | Path] = [
            _DEVILUTIONX_BIN,
            '--data-dir',
            _DATA_DIR,
            '--config-dir',
            self.config_dir,
            '--save-dir',
            self.saves_dir,
        ]

        if self.rom.name.endswith('hellfire.mpq'):
            args.append('--hellfire')
        elif self.rom.name.endswith('spawn.mpq'):
            args.append('--spawn')
        else:
            args.append('--diablo')

        if self.config.show_fps:
            args.append('-f')

        return Command(args)

    async def _write_config(self, config_file: Path, /) -> None:
        cfg = CaseSensitiveRawConfigParser()
        if config_file.exists():
            cfg.read(config_file)

        # Graphics
        _set(cfg, 'Graphics', 'Fit to Screen', self.config.get_bool('devilutionx_stretch', return_values=('1', '0')))

        with config_file.open('w') as f:
            cfg.write(f)
