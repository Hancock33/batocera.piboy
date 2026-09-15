from __future__ import annotations

from importlib import import_module
from typing import TYPE_CHECKING, Final

from ..exceptions import BatoceraException

if TYPE_CHECKING:
    from .Generator import Generator

_LEGACY_GENERATOR_MAP: Final[dict[str, dict[str, tuple[str, str]]]] = {
    'duckstation': {
        'duckstation-legacy': ('duckstation_legacy.duckstationLegacyGenerator', 'DuckstationLegacyGenerator'),
    }
}

_GENERATOR_MAP: Final[dict[str, tuple[str, str]]] = {
    'droidports': ('droidports.droidportsGenerator', 'DroidportsGenerator'),
    'duckstation': ('duckstation.duckstationGenerator', 'DuckstationGenerator'),
    'eden': ('eden.edenGenerator', 'EdenGenerator'),
    'etekwar': ('etekwar.etekwarGenerator', 'EtekwarGenerator'),
    'f2bgl': ('f2bgl.f2bglGenerator', 'F2bglGenerator'),
    'freedroid': ('freedroid.freedroidGenerator', 'FreedroidGenerator'),
    'hode': ('hode.hodeGenerator', 'HodeGenerator'),
    'libretro': ('libretro.libretroGenerator', 'LibretroGenerator'),
    'linuxloader': ('linuxloader.linuxloaderGenerator', 'LinuxLoaderGenerator'),
    'mame': ('mame.mameGenerator', 'MameGenerator'),
    'nblood': ('nblood.nbloodGenerator', 'NbloodGenerator'),
    'nesbox': ('nesbox.nesboxGenerator', 'NesboxGenerator'),
    'omf2097': ('omf2097.omf2097Generator', 'Omf2097Generator'),
    'openclaw': ('openclaw.openclawGenerator', 'OpenclawGenerator'),
    'openlara': ('openlara.openlaraGenerator', 'OpenlaraGenerator'),
    'opentyrian': ('opentyrian.opentyrianGenerator', 'OpentyrianGenerator'),
    'prototype': ('prototype.prototypeGenerator', 'PrototypeGenerator'),
    'raptor': ('raptor.raptorGenerator', 'RaptorGenerator'),
    'rott': ('rott.rottGenerator', 'RottGenerator'),
    'rtcw': ('rtcw.rtcwGenerator', 'RtcwGenerator'),
    'ryujinx': ('ryujinx.ryujinxGenerator', 'RyujinxGenerator'),
    'serioussam': ('serioussam.serioussamGenerator', 'SerioussamGenerator'),
    'sm64': ('sm64.sm64Generator', 'Sm64Generator'),
    'sonic2013': ('sonicretro.sonicretroGenerator', 'SonicRetroGenerator'),
    'soniccd': ('sonicretro.sonicretroGenerator', 'SonicRetroGenerator'),
    'sonicmania': ('sonicmania.sonicmaniaGenerator', 'SonicManiaGenerator'),
    'sonicnexus': ('sonicnexus.sonicnexusGenerator', 'SonicNexusGenerator'),
    'spacecadetpinball': ('spacecadetpinball.spacecadetpinballGenerator', 'SpacecadetpinballGenerator'),
    'srb2': ('srb2.srb2Generator', 'Srb2Generator'),
    'srb2kart': ('srb2kart.srb2kartGenerator', 'Srb2kartGenerator'),
    'stalker': ('stalker.stalkerGenerator', 'StalkerGenerator'),
    'stk': ('stk.stkGenerator', 'StkGenerator'),
    'stuntcar': ('stuntcar.stuntcarGenerator', 'StuntcarGenerator'),
    'supermodel': ('supermodel.supermodelGenerator', 'SupermodelGenerator'),
    'supertux2': ('supertux2.supertux2Generator', 'Supertux2Generator'),
    'touchhle': ('touchhle.touchhleGenerator', 'TouchHLEGenerator'),
    'vcmi': ('vcmi.vcmiGenerator', 'VcmiGenerator'),
    'witchaven': ('witchaven.witchavenGenerator', 'WitchavenGenerator'),
    'xboxcloud': ('xboxcloud.xboxcloudGenerator', 'XboxcloudGenerator'),
    'yabasanshiro': ('yabasanshiro.yabasanshiroGenerator', 'YabasanshiroGenerator'),
}

def get_generator(emulator: str, core: str) -> Generator:
    if (cores := _LEGACY_GENERATOR_MAP.get(emulator)) and core in cores:
        module_path, cls_name = cores[core]
    elif emulator in _GENERATOR_MAP:
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
