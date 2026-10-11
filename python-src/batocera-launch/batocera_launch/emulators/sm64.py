from __future__ import annotations

from typing import TYPE_CHECKING, Final

from batocera_common.dataclasses import cached_dataclass, cached_property
from batocera_common.paths import SAVES
from batocera_launch import Command, Emulator, HotkeysContext

if TYPE_CHECKING:
    from pathlib import Path

_SAVES: Final = SAVES / 'sm64'

# extension -> (binary, save directory)
_REGIONS: Final[dict[str, tuple[str, Path]]] = {
    '.e64': ('sm64.eu', _SAVES / 'eu'),
    '.j64': ('sm64.jp', _SAVES / 'jp'),
    '.u64': ('sm64.us', _SAVES / 'us'),
}
_DEFAULT_REGION: Final = '.e64'


@cached_dataclass
class Sm64(Emulator):
    needs_sdl_game_controller_config = True

    @cached_property
    def hotkeygen_context(self) -> HotkeysContext:
        return {
            'name': 'sm64',
            'keys': {'exit': ['KEY_LEFTALT', 'KEY_F4']},
        }

    @property
    def execution_path(self) -> Path | None:
        return self.rom

    async def configure(self) -> Command:
        extension = self.rom.suffix.lower() if len(self.rom.suffix) >= 3 else _DEFAULT_REGION
        binary, savedir = _REGIONS.get(extension, _REGIONS[_DEFAULT_REGION])
        savedir.mkdir(parents=True, exist_ok=True)

        args: list[str | Path] = [binary, '--gamedir', './', '--savepath', savedir]

        # Skip Intro
        if self.config.get_bool('nointro'):
            args.append('--skip-intro')
        # Cheat Menu
        if self.config.get_bool('cheatsmenu'):
            args.append('--cheats')

        return Command(args)
