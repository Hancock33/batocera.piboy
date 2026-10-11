from __future__ import annotations

from typing import TYPE_CHECKING, Final

from batocera_common.dataclasses import cached_dataclass, cached_property
from batocera_common.paths import ROMS
from batocera_launch import Command, Emulator, HotkeysContext

if TYPE_CHECKING:
    from collections.abc import Collection
    from pathlib import Path

_ROM_DIR: Final = ROMS / 'ports' / 'awgl'

# Game versions, detected from the rom name; each one has its own data directory.
_VERSIONS: Final = ('15th', '20th', '3DO', 'Amiga', 'Atari', 'DOS', 'Win31')

_RENDERERS: Final = ('original', 'software', 'gl')
_AUDIO_MODES: Final = ('original', 'remastered')
_LANGUAGES: Final = ('us', 'fr', 'de', 'es', 'it')
_DIFFICULTIES: Final = ('easy', 'normal', 'hard')
_FULLSCREEN_FLAGS: Final[dict[str, str]] = {'stretched': '--fullscreen', 'wide': '--fullscreen-ar'}


def _choice(value: str | None, options: Collection[str], /) -> str:
    if value is not None and value in options:
        return value
    return next(iter(options))


@cached_dataclass
class Awgl(Emulator):
    needs_sdl_game_controller_config = True

    @cached_property
    def hotkeygen_context(self) -> HotkeysContext:
        return {
            'name': 'awgl',
            'keys': {'exit': ['KEY_LEFTALT', 'KEY_F4']},
        }

    @property
    def execution_path(self) -> Path | None:
        return _ROM_DIR

    async def configure(self) -> Command:
        args: list[str | Path] = ['awgl']

        for version in _VERSIONS:
            if version in self.rom.stem:
                args.append(f'--datapath={_ROM_DIR / version}')
                if version == 'DOS':
                    args.append('--mt32')

        args.extend(
            (
                f'--render={_choice(self.config.get_str("awgl_render"), _RENDERERS)}',
                _FULLSCREEN_FLAGS.get(self.config.get_str('awgl_fullscreen') or '', '--fullscreen'),
                f'--audio={_choice(self.config.get_str("awgl_audio"), _AUDIO_MODES)}',
                f'--language={_choice(self.config.get_str("awgl_language"), _LANGUAGES)}',
                f'--difficulty={_choice(self.config.get_str("awgl_difficulty"), _DIFFICULTIES)}',
            )
        )

        # EGA screen mode for DOS
        if self.config.get_str('awgl_egados') == 'enabled':
            args.append('--ega-palette')

        return Command(args, env={'SDL_AUTO_UPDATE_JOYSTICKS': '0'})
