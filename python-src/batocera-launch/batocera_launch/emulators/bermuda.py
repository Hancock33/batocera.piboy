from __future__ import annotations

from batocera_common.dataclasses import cached_dataclass, cached_property
from batocera_launch import Command, Emulator, HotkeysContext


@cached_dataclass
class Bermuda(Emulator):
    needs_sdl_game_controller_config = True

    @cached_property
    def hotkeygen_context(self) -> HotkeysContext:
        return {
            'name': 'bermuda',
            'keys': {'exit': ['KEY_LEFTALT', 'KEY_F4']},
        }

    async def configure(self) -> Command:
        args: list[str | Path] = ['bermuda', '--datapath=/userdata/roms/ports/bermuda', '--musicpath=/userdata/roms/ports/bermuda/MUSIC', '--savepath=/userdata/saves/bermuda', '--fullscreen']

        if self.config.get_bool('bermuda_aspect'):
            args.append('--widescreen=16:9')

        return Command(
            args,
            env={
                'SDL_JOYSTICK_HIDAPI': '0',
            },
        )
