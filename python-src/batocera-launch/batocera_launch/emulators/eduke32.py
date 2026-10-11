from __future__ import annotations

from typing import TYPE_CHECKING, Final

from batocera_common.dataclasses import cached_dataclass, cached_property
from batocera_common.paths import CONFIGS, SAVES
from batocera_launch import Command, Emulator, HotkeysContext

if TYPE_CHECKING:
    from pathlib import Path

_EDUKE32_BIN: Final = 'eduke32'

_RTS_REPLACEMENTS: Final[tuple[tuple[str, str], ...]] = (
    ('.GRP', '.RTS'),
    ('.grp', '.rts'),
    ('.EDUKE', '.RTS'),
    ('.eduke', '.rts'),
)
_GRP_REPLACEMENTS: Final[tuple[tuple[str, str], ...]] = (
    ('.eduke', '.GRP'),
    ('.EDUKE', '.GRP'),
)


def _replace_all(value: str, replacements: tuple[tuple[str, str], ...], /) -> str:
    for old, new in replacements:
        value = value.replace(old, new)
    return value


def _rts_file(rom: Path, /) -> str:
    return _replace_all(rom.name, _RTS_REPLACEMENTS)


def _grp_file(rom: Path, /) -> str:
    return _replace_all(str(rom), _GRP_REPLACEMENTS)


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
        self.config_dir.mkdir(parents=True, exist_ok=True)
        self.saves_dir.mkdir(parents=True, exist_ok=True)

        args: list[str | Path] = [_EDUKE32_BIN]
        rts = _rts_file(self.rom)

        if self.rom.name.lower().endswith('eduke'):
            group = self.rom.read_text().splitlines()[0]
            args.extend([_grp_file(self.rom), '-game_dir', self.rom.parent, '-g', group, '-rts', rts])
        else:
            args.extend([self.rom, '-game_dir', self.rom.parent, '-rts', rts])

        if self.config.get_bool('nologo'):
            args.append('-nologo')

        return Command(args)
