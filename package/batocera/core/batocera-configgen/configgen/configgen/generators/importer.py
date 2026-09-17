from __future__ import annotations

from importlib import import_module
from typing import TYPE_CHECKING, Final

from ..exceptions import BatoceraException

if TYPE_CHECKING:
    from .Generator import Generator

_GENERATOR_MAP: Final[dict[str, tuple[str, str]]] = {
    'armsx2': ('armsx2.armsx2Generator', 'Armsx2Generator'),
    'duckstation': ('duckstation.duckstationGenerator', 'DuckstationGenerator'),
    'eden': ('eden.edenGenerator', 'EdenGenerator'),
    'etekwar': ('etekwar.etekwarGenerator', 'EtekwarGenerator'),
    'libretro': ('libretro.libretroGenerator', 'LibretroGenerator'),
    'linuxloader': ('linuxloader.linuxloaderGenerator', 'LinuxLoaderGenerator'),
    'mame': ('mame.mameGenerator', 'MameGenerator'),
    'nesbox': ('nesbox.nesboxGenerator', 'NesboxGenerator'),
    'omf2097': ('omf2097.omf2097Generator', 'Omf2097Generator'),
    'openclaw': ('openclaw.openclawGenerator', 'OpenclawGenerator'),
    'openlara': ('openlara.openlaraGenerator', 'OpenlaraGenerator'),
    'raptor': ('raptor.raptorGenerator', 'RaptorGenerator'),
    'ryujinx': ('ryujinx.ryujinxGenerator', 'RyujinxGenerator'),
    'stalker': ('stalker.stalkerGenerator', 'StalkerGenerator'),
    'stk': ('stk.stkGenerator', 'StkGenerator'),
    'touchhle': ('touchhle.touchhleGenerator', 'TouchHLEGenerator'),
    'xboxcloud': ('xboxcloud.xboxcloudGenerator', 'XboxcloudGenerator'),
    'yabasanshiro': ('yabasanshiro.yabasanshiroGenerator', 'YabasanshiroGenerator'),
}

def get_generator(emulator: str, core: str) -> Generator:
    if emulator in _GENERATOR_MAP:
        module_path, cls_name = _GENERATOR_MAP[emulator]
    else:
        module_path = f'{emulator}.{emulator}Generator'
        cls_name = f'{emulator[0].upper()}{emulator[1:]}Generator'

    try:
        module = import_module(f'..{module_path}', package=__name__)
        generator_cls: type[Generator] = getattr(module, cls_name)
    except ImportError as e:
        if e.name is not None and e.name.startswith(__name__.split('.')[0]):
            raise BatoceraException(f'No generator found for emulator {emulator}') from e

        raise BatoceraException(f'Error importing generator for emulator {emulator}') from e
    except AttributeError as e:
        raise BatoceraException(f'No generator found for emulator {emulator}') from e

    return generator_cls()
