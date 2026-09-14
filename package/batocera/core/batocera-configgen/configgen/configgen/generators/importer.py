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
    'doomretro': ('doomretro.doomretroGenerator', 'DoomretroGenerator'),
    'droidports': ('droidports.droidportsGenerator', 'DroidportsGenerator'),
    'duckstation': ('duckstation.duckstationGenerator', 'DuckstationGenerator'),
    'dxx-rebirth': ('dxx_rebirth.dxx_rebirthGenerator', 'DXX_RebirthGenerator'),
    'ecwolf': ('ecwolf.ecwolfGenerator', 'ECWolfGenerator'),
    'eden': ('eden.edenGenerator', 'EdenGenerator'),
    'eduke32': ('eduke32.eduke32Generator', 'Eduke32Generator'),
    'etekwar': ('etekwar.etekwarGenerator', 'EtekwarGenerator'),
    'etlegacy': ('etlegacy.etlegacyGenerator', 'ETLegacyGenerator'),
    'f2bgl': ('f2bgl.f2bglGenerator', 'F2bglGenerator'),
    'fallout1-ce': ('fallout1.fallout1Generator', 'Fallout1Generator'),
    'fallout2-ce': ('fallout2.fallout2Generator', 'Fallout2Generator'),
    'fba2x': ('fba2x.fba2xGenerator', 'Fba2xGenerator'),
    'flatpak': ('flatpak.flatpakGenerator', 'FlatpakGenerator'),
    'freedroid': ('freedroid.freedroidGenerator', 'FreedroidGenerator'),
    'hode': ('hode.hodeGenerator', 'HodeGenerator'),
    'hurrican': ('hurrican.hurricanGenerator', 'HurricanGenerator'),
    'hypseus-singe': ('hypseus_singe.hypseusSingeGenerator', 'HypseusSingeGenerator'),
    'ionfury': ('ionfury.ionfuryGenerator', 'IonfuryGenerator'),
    'quake3': ('ioquake3.ioquake3Generator', 'IOQuake3Generator'),
    'vkquake3': ('ioquake3.ioquake3Generator', 'IOQuake3Generator'),
    'jazz2-native': ('jazz2_native.jazz2_nativeGenerator', 'Jazz2_NativeGenerator'),
    'kodi': ('kodi.kodiGenerator', 'KodiGenerator'),
    'libretro': ('libretro.libretroGenerator', 'LibretroGenerator'),
    'linuxloader': ('linuxloader.linuxloaderGenerator', 'LinuxLoaderGenerator'),
    'mame': ('mame.mameGenerator', 'MameGenerator'),
    'nblood': ('nblood.nbloodGenerator', 'NbloodGenerator'),
    'nesbox': ('nesbox.nesboxGenerator', 'NesboxGenerator'),
    'nukem2': ('nukem2.nukem2Generator', 'Nukem2Generator'),
    'odcommander': ('odcommander.odcommanderGenerator', 'OdcommanderGenerator'),
    'omf2097': ('omf2097.omf2097Generator', 'Omf2097Generator'),
    'openclaw': ('openclaw.openclawGenerator', 'OpenclawGenerator'),
    'openjazz': ('openjazz.openjazzGenerator', 'OpenJazzGenerator'),
    'openjkdf2': ('openjkdf2.openjkdf2Generator', 'OpenJKDF2Generator'),
    'openjk': ('openjk.openjkGenerator', 'OpenJKGenerator'),
    'openlara': ('openlara.openlaraGenerator', 'OpenlaraGenerator'),
    'openmohaa': ('openmohaa.openmohaaGenerator', 'OpenMOHAAGenerator'),
    'opentyrian': ('opentyrian.opentyrianGenerator', 'OpentyrianGenerator'),
    'pcexhumed': ('pcexhumed.pcexhumedGenerator', 'PcexhumedGenerator'),
    'prototype': ('prototype.prototypeGenerator', 'PrototypeGenerator'),
    'pygame': ('pygame.pygameGenerator', 'PygameGenerator'),
    'pyxel': ('pyxel.pyxelGenerator', 'PyxelGenerator'),
    'raptor': ('raptor.raptorGenerator', 'RaptorGenerator'),
    'raze': ('raze.razeGenerator', 'RazeGenerator'),
    'rednukem': ('rednukem.rednukemGenerator', 'RednukemGenerator'),
    'rott': ('rott.rottGenerator', 'RottGenerator'),
    'rtcw': ('rtcw.rtcwGenerator', 'RtcwGenerator'),
    'ryujinx': ('ryujinx.ryujinxGenerator', 'RyujinxGenerator'),
    'sdlpop': ('sdlpop.sdlpopGenerator', 'SdlPopGenerator'),
    'serioussam': ('serioussam.serioussamGenerator', 'SerioussamGenerator'),
    'sh': ('sh.shGenerator', 'ShGenerator'),
    'sm64': ('sm64.sm64Generator', 'Sm64Generator'),
    'sonicmania': ('sonicmania.sonicmaniaGenerator', 'SonicManiaGenerator'),
    'sonicnexus': ('sonicnexus.sonicnexusGenerator', 'SonicNexusGenerator'),
    'sonic2013': ('sonicretro.sonicretroGenerator', 'SonicRetroGenerator'),
    'soniccd': ('sonicretro.sonicretroGenerator', 'SonicRetroGenerator'),
    'spacecadetpinball': ('spacecadetpinball.spacecadetpinballGenerator', 'SpacecadetpinballGenerator'),
    'srb2': ('srb2.srb2Generator', 'Srb2Generator'),
    'srb2kart': ('srb2kart.srb2kartGenerator', 'Srb2kartGenerator'),
    'stalker': ('stalker.stalkerGenerator', 'StalkerGenerator'),
    'steam': ('steam.steamGenerator', 'SteamGenerator'),
    'stella': ('stella.stellaGenerator', 'StellaGenerator'),
    'stk': ('stk.stkGenerator', 'StkGenerator'),
    'stuntcar': ('stuntcar.stuntcarGenerator', 'StuntcarGenerator'),
    'supermodel': ('supermodel.supermodelGenerator', 'SupermodelGenerator'),
    'supertux2': ('supertux2.supertux2Generator', 'Supertux2Generator'),
    'theforceengine': ('theforceengine.theforceengineGenerator', 'TheForceEngineGenerator'),
    'touchhle': ('touchhle.touchhleGenerator', 'TouchHLEGenerator'),
    'trx': ('trx.trxGenerator', 'TRXGenerator'),
    'uqm': ('uqm.uqmGenerator', 'UqmGenerator'),
    'vcmi': ('vcmi.vcmiGenerator', 'VcmiGenerator'),
    'vkquake2': ('vkquake2.vkquake2Generator', 'VKQuake2Generator'),
    'vkquake': ('vkquake.vkquakeGenerator', 'VKQuakeGenerator'),
    'voidsw': ('voidsw.voidswGenerator', 'VoidswGenerator'),
    'wine': ('wine.wineGenerator', 'WineGenerator'),
    'witchaven': ('witchaven.witchavenGenerator', 'WitchavenGenerator'),
    'xash3d_fwgs': ('xash3d_fwgs.xash3dFwgsGenerator', 'Xash3dFwgsGenerator'),
    'xboxcloud': ('xboxcloud.xboxcloudGenerator', 'XboxcloudGenerator'),
    'yabasanshiro': ('yabasanshiro.yabasanshiroGenerator', 'YabasanshiroGenerator'),
    'yquake2': ('yquake2.yquake2Generator', 'YQuake2Generator'),
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
