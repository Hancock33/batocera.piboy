#!/usr/bin/env python

import generators

# not the nicest way, possibly one of the faster i think
# some naming rules may allow to modify this function to less than 10 lines

def getGenerator(emulator):

    if emulator == 'abuse':
        from generators.abuse.abuseGenerator import AbuseGenerator
        return AbuseGenerator()

    if emulator == 'amiberry':
        from generators.amiberry.amiberryGenerator import AmiberryGenerator
        return AmiberryGenerator()

    if emulator == 'applewin':
        from generators.applewin.applewinGenerator import AppleWinGenerator
        return AppleWinGenerator()

    if emulator == 'alephone':
        from generators.alephone.alephoneGenerator import AlephoneGenerator
        return AlephoneGenerator()

    if emulator == 'avp':
        from generators.avp.avpGenerator import AvpGenerator
        return AvpGenerator()

    if emulator == 'awgl':
        from generators.awgl.awglGenerator import AwglGenerator
        return AwglGenerator()

    if emulator == 'bbja':
        from generators.bbja.bbjaGenerator import BbjaGenerator
        return BbjaGenerator()

    if emulator == 'bermuda':
        from generators.bermuda.bermudaGenerator import BermudaGenerator
        return BermudaGenerator()

    if emulator == 'bigpemu':
        from generators.bigpemu.bigpemuGenerator import BigPEmuGenerator
        return BigPEmuGenerator()

    if emulator == 'blues':
        from generators.blues.bluesGenerator import BluesGenerator
        return BluesGenerator()

    if emulator == 'bstone':
        from generators.bstone.bstoneGenerator import BstoneGenerator
        return BstoneGenerator()

    if emulator == 'cannonball':
        from generators.cannonball.cannonballGenerator import CannonballGenerator
        return CannonballGenerator()

    if emulator == 'cdogs':
        from generators.cdogs.cdogsGenerator import CdogsGenerator
        return CdogsGenerator()

    if emulator == 'cemu':
        from generators.cemu.cemuGenerator import CemuGenerator
        return CemuGenerator()

    if emulator == 'cgenius':
        from generators.cgenius.cgeniusGenerator import CGeniusGenerator
        return CGeniusGenerator()

    if emulator == 'citra' :
        from generators.citra.citraGenerator import CitraGenerator
        return CitraGenerator()

    if emulator == 'demul':
        from generators.demul.demulGenerator import DemulGenerator
        return DemulGenerator()

    if emulator == 'devilutionx':
        from generators.devilutionx.devilutionxGenerator import DevilutionXGenerator
        return DevilutionXGenerator()

    if emulator == 'dolphin':
        from generators.dolphin.dolphinGenerator import DolphinGenerator
        return DolphinGenerator()

    if emulator == 'dolphin_triforce':
        from generators.dolphin_triforce.dolphinTriforceGenerator import DolphinTriforceGenerator
        return DolphinTriforceGenerator()

    if emulator == 'doom3':
        from generators.doom3.doom3Generator import Doom3Generator
        return Doom3Generator()

    if emulator == 'doomretro':
        from generators.doomretro.doomretroGenerator import DoomretroGenerator
        return DoomretroGenerator()

    if emulator == 'dosbox':
        from generators.dosbox.dosboxGenerator import DosBoxGenerator
        return DosBoxGenerator()

    if emulator == 'dosbox_staging':
        from generators.dosboxstaging.dosboxstagingGenerator import DosBoxStagingGenerator
        return DosBoxStagingGenerator()

    if emulator == 'dosboxx':
        from generators.dosboxx.dosboxxGenerator import DosBoxxGenerator
        return DosBoxxGenerator()

    if emulator == 'drastic':
        from generators.drastic.drasticGenerator import DrasticGenerator
        return DrasticGenerator()

    if emulator == 'droidports':
        from generators.droidports.droidportsGenerator import DroidportsGenerator
        return DroidportsGenerator()

    if emulator == 'duckstation':
        from generators.duckstation.duckstationGenerator import DuckstationGenerator
        return DuckstationGenerator()

    if emulator == 'duckstation-legacy':
        from generators.duckstation_legacy.duckstationLegacyGenerator import DuckstationLegacyGenerator
        return DuckstationLegacyGenerator()

    if emulator == "dxx-rebirth":
        from generators.dxx_rebirth.dxx_rebirthGenerator import DXX_RebirthGenerator
        return DXX_RebirthGenerator()

    if emulator == 'easyrpg':
        from generators.easyrpg.easyrpgGenerator import EasyRPGGenerator
        return EasyRPGGenerator()

    if emulator == 'ecwolf':
        from generators.ecwolf.ecwolfGenerator import ECWolfGenerator
        return ECWolfGenerator()

    if emulator == 'eduke32':
        from generators.eduke32.eduke32Generator import Eduke32Generator
        return Eduke32Generator()

    if emulator == 'etekwar':
        from generators.etekwar.etekwarGenerator import EtekwarGenerator
        return EtekwarGenerator()

    if emulator == "etlegacy":
        from generators.etlegacy.etlegacyGenerator import ETLegacyGenerator
        return ETLegacyGenerator()

    if emulator == 'f2bgl':
        from generators.f2bgl.f2bglGenerator import F2bglGenerator
        return F2bglGenerator()

    if emulator == "fallout1-ce":
        from generators.fallout1.fallout1Generator import Fallout1Generator
        return Fallout1Generator()

    if emulator == "fallout2-ce":
        from generators.fallout2.fallout2Generator import Fallout2Generator
        return Fallout2Generator()

    if emulator == 'fba2x':
        from generators.fba2x.fba2xGenerator import Fba2xGenerator
        return Fba2xGenerator()

    if emulator == 'flatpak':
        from generators.flatpak.flatpakGenerator import FlatpakGenerator
        return FlatpakGenerator()

    if emulator == 'flycast':
        from generators.flycast.flycastGenerator import FlycastGenerator
        return FlycastGenerator()

    if emulator == 'freedroid':
        from generators.freedroid.freedroidGenerator import FreedroidGenerator
        return FreedroidGenerator()

    if emulator == 'fpinball':
        from generators.fpinball.fpinballGenerator import FpinballGenerator
        return FpinballGenerator()

    if emulator == 'fsuae':
        from generators.fsuae.fsuaeGenerator import FsuaeGenerator
        return FsuaeGenerator()

    if emulator == 'gsplus':
        from generators.gsplus.gsplusGenerator import GSplusGenerator
        return GSplusGenerator()

    if emulator == 'gzdoom':
        from generators.gzdoom.gzdoomGenerator import GzdoomGenerator
        return GzdoomGenerator()

    if emulator == 'halflife2':
        from generators.halflife2.halflife2Generator import Halflife2Generator
        return Halflife2Generator()

    if emulator == 'hatari':
        from generators.hatari.hatariGenerator import HatariGenerator
        return HatariGenerator()

    if emulator == 'hcl':
        from generators.hcl.hclGenerator import HclGenerator
        return HclGenerator()

    if emulator == 'hode':
        from generators.hode.hodeGenerator import HodeGenerator
        return HodeGenerator()

    if emulator == 'hurrican':
        from generators.hurrican.hurricanGenerator import HurricanGenerator
        return HurricanGenerator()

    if emulator == 'hypseus-singe' :
        from generators.hypseus_singe.hypseusSingeGenerator import HypseusSingeGenerator
        return HypseusSingeGenerator()

    if emulator == "ikemen":
        from generators.ikemen.ikemenGenerator import IkemenGenerator
        return IkemenGenerator()

    if emulator == 'ionfury':
        from generators.ionfury.ionfuryGenerator import IonfuryGenerator
        return IonfuryGenerator()

    if emulator == 'kodi':
        from generators.kodi.kodiGenerator import KodiGenerator
        return KodiGenerator()

    if emulator == 'lexaloffle':
        from generators.lexaloffle.lexaloffleGenerator import LexaloffleGenerator
        return LexaloffleGenerator()

    if emulator == 'libretro':
        from generators.libretro.libretroGenerator import LibretroGenerator
        return LibretroGenerator()

    if emulator == 'lightspark':
        from generators.lightspark.lightsparkGenerator import LightsparkGenerator
        return LightsparkGenerator()

    if emulator == 'mame':
        from generators.mame.mameGenerator import MameGenerator
        return MameGenerator()

    if emulator == 'melonds':
        from generators.melonds.melondsGenerator import MelonDSGenerator
        return MelonDSGenerator()

    if emulator == 'model2emu':
        from generators.model2emu.model2emuGenerator import Model2EmuGenerator
        return Model2EmuGenerator()

    if emulator == 'moonlight':
        from generators.moonlight.moonlightGenerator import MoonlightGenerator
        return MoonlightGenerator()

    if emulator == 'mplayer':
        from generators.mplayer.mplayerGenerator import MplayerGenerator
        return MplayerGenerator()

    if emulator == 'mugen':
        from generators.mugen.mugenGenerator import MugenGenerator
        return MugenGenerator()

    if emulator == 'mupen64plus':
        from generators.mupen.mupenGenerator import MupenGenerator
        return MupenGenerator()

    if emulator == 'nblood':
        from generators.nblood.nbloodGenerator import NbloodGenerator
        return NbloodGenerator()

    if emulator == 'nukem2':
        from generators.nukem2.nukem2Generator import Nukem2Generator
        return Nukem2Generator()

    if emulator == 'odcommander':
        from generators.odcommander.odcommanderGenerator import OdcommanderGenerator
        return OdcommanderGenerator()

    if emulator == 'openbor':
        from generators.openbor.openborGenerator import OpenborGenerator
        return OpenborGenerator()

    if emulator == 'openclaw':
        from generators.openclaw.openclawGenerator import OpenclawGenerator
        return OpenclawGenerator()

    if emulator == 'openjazz':
        from generators.openjazz.openjazzGenerator import OpenJazzGenerator
        return OpenJazzGenerator()

    if emulator == 'openjkja':
        from generators.openjkja.openjkjaGenerator import OpenjkjaGenerator
        return OpenjkjaGenerator()

    if emulator == 'openjkjo':
        from generators.openjkjo.openjkjoGenerator import OpenjkjoGenerator
        return OpenjkjoGenerator()

    if emulator == 'openlara':
        from generators.openlara.openlaraGenerator import OpenlaraGenerator
        return OpenlaraGenerator()

    if emulator == 'openmsx':
        from generators.openmsx.openmsxGenerator import OpenmsxGenerator
        return OpenmsxGenerator()

    if emulator == 'omf2097':
        from generators.omf2097.omf2097Generator import Omf2097Generator
        return Omf2097Generator()

    if emulator == 'opentyrian':
        from generators.opentyrian.opentyrianGenerator import OpentyrianGenerator
        return OpentyrianGenerator()

    if emulator == 'panda3ds':
        from generators.panda3ds.panda3dsGenerator import Panda3dsGenerator
        return Panda3dsGenerator()

    if emulator == 'pcexhumed':
        from generators.pcexhumed.pcexhumedGenerator import PcexhumedGenerator
        return PcexhumedGenerator()

    if emulator == 'pcsx2':
        from generators.pcsx2.pcsx2Generator import Pcsx2Generator
        return Pcsx2Generator()

    if emulator == 'play':
        from generators.play.playGenerator import PlayGenerator
        return PlayGenerator()

    if emulator == 'ppsspp':
        from generators.ppsspp.ppssppGenerator import PPSSPPGenerator
        return PPSSPPGenerator()

    if emulator == 'pre2':
        from generators.pre2.pre2Generator import Pre2Generator
        return Pre2Generator()

    if emulator == 'prototype':
        from generators.prototype.prototypeGenerator import PrototypeGenerator
        return PrototypeGenerator()

    if emulator == 'pygame':
        from generators.pygame.pygameGenerator import PygameGenerator
        return PygameGenerator()

    if emulator == 'pyxel':
        from generators.pyxel.pyxelGenerator import PyxelGenerator
        return PyxelGenerator()

    if emulator == 'quakespasm':
        from generators.quakespasm.quakespasmGenerator import QuakespasmGenerator
        return QuakespasmGenerator()

    if emulator == 'quake3':
        from generators.quake3.quake3Generator import Quake3Generator
        return Quake3Generator()

    if emulator == 'raptor':
        from generators.raptor.raptorGenerator import RaptorGenerator
        return RaptorGenerator()

    if emulator == "raze":
        from generators.raze.razeGenerator import RazeGenerator
        return RazeGenerator()

    if emulator == 'rednukem':
        from generators.rednukem.rednukemGenerator import RednukemGenerator
        return RednukemGenerator()

    if emulator == 'redream':
        from generators.redream.redreamGenerator import RedreamGenerator
        return RedreamGenerator()

    if emulator == 'rpcs3':
        from generators.rpcs3.rpcs3Generator import Rpcs3Generator
        return Rpcs3Generator()

    if emulator == 'rott':
        from generators.rott.rottGenerator import RottGenerator
        return RottGenerator()

    if emulator == 'rtcw':
        from generators.rtcw.rtcwGenerator import RtcwGenerator
        return RtcwGenerator()

    if emulator == 'ruffle':
        from generators.ruffle.ruffleGenerator import RuffleGenerator
        return RuffleGenerator()

    if emulator == 'ryujinx':
        from generators.ryujinx.ryujinxGenerator import RyujinxGenerator
        return RyujinxGenerator()

    if emulator == 'ryujinxng':
        from generators.ryujinxng.ryujinxngGenerator import RyujinxNGGenerator
        return RyujinxGenerator()

    if emulator == 'samcoupe':
        from generators.samcoupe.samcoupeGenerator import SamcoupeGenerator
        return SamcoupeGenerator()

    if emulator == 'scummvm':
        from generators.scummvm.scummvmGenerator import ScummVMGenerator
        return ScummVMGenerator()

    if emulator == 'sdlpop':
        from generators.sdlpop.sdlpopGenerator import SdlPopGenerator
        return SdlPopGenerator()

    if emulator == 'serioussam':
        from generators.serioussam.serioussamGenerator import SerioussamGenerator
        return SerioussamGenerator()

    if emulator == "uqm":
        from generators.uqm.uqmGenerator import UqmGenerator
        return UqmGenerator()

    if emulator == 'sh':
        from generators.sh.shGenerator import ShGenerator
        return ShGenerator()

    if emulator == 'sm64':
        from generators.sm64.sm64Generator import Sm64Generator
        return Sm64Generator()

    if emulator == 'solarus':
        from generators.solarus.solarusGenerator import SolarusGenerator
        return SolarusGenerator()

    if emulator == "sonic3-air":
        from generators.sonic3_air.sonic3_airGenerator import Sonic3AIRGenerator
        return Sonic3AIRGenerator()

    if emulator == 'sonic2013':
        from generators.sonicretro.sonicretroGenerator import SonicRetroGenerator
        return SonicRetroGenerator()

    if emulator == 'soniccd':
        from generators.sonicretro.sonicretroGenerator import SonicRetroGenerator
        return SonicRetroGenerator()

    if emulator == "sonicmania":
        from generators.sonicmania.sonicmaniaGenerator import SonicManiaGenerator
        return SonicManiaGenerator()

    if emulator == "sonicnexus":
        from generators.sonicnexus.sonicnexusGenerator import SonicNexusGenerator
        return SonicNexusGenerator()

    if emulator == 'sorr':
        from generators.sorr.sorrGenerator import SorrGenerator
        return SorrGenerator()

    if emulator == 'spacecadetpinball':
        from generators.spacecadetpinball.spacecadetpinballGenerator import SpacecadetpinballGenerator
        return SpacecadetpinballGenerator()

    if emulator == 'srb2':
        from generators.srb2.srb2Generator import Srb2Generator
        return Srb2Generator()

    if emulator == 'srb2kart':
        from generators.srb2kart.srb2kartGenerator import Srb2kartGenerator
        return Srb2kartGenerator()

    if emulator == 'steam':
        from generators.steam.steamGenerator import SteamGenerator
        return SteamGenerator()

    if emulator == 'stalker':
        from generators.stalker.stalkerGenerator import StalkerGenerator
        return StalkerGenerator()

    if emulator == 'stella':
        from generators.stella.stellaGenerator import StellaGenerator
        return StellaGenerator()

    if emulator == "theforceengine":
        from generators.theforceengine.theforceengineGenerator import TheForceEngineGenerator
        return TheForceEngineGenerator()

    if emulator == 'stk':
        from generators.stk.stkGenerator import StkGenerator
        return StkGenerator()

    if emulator == 'stuntcar':
        from generators.stuntcar.stuntcarGenerator import StuntcarGenerator
        return StuntcarGenerator()

    if emulator == 'supermodel':
        from generators.supermodel.supermodelGenerator import SupermodelGenerator
        return SupermodelGenerator()

    if emulator == 'supertux2':
        from generators.supertux2.supertux2Generator import Supertux2Generator
        return Supertux2Generator()

    if emulator == 'suyu':
        from generators.suyu.suyuGenerator import SuyuGenerator
        return SuyuGenerator()

    if emulator == 'themehospital':
        from generators.themehospital.themehospitalGenerator import ThemehospitalGenerator
        return ThemehospitalGenerator()

    if emulator == 'tsugaru':
        from generators.tsugaru.tsugaruGenerator import TsugaruGenerator
        return TsugaruGenerator()

    if emulator == "thextech":
        from generators.thextech.thextechGenerator import TheXTechGenerator
        return TheXTechGenerator()

    if emulator == 'vanillara':
        from generators.vanillara.vanillaraGenerator import VanillaraGenerator
        return VanillaraGenerator()

    if emulator == 'vanillatd':
        from generators.vanillatd.vanillatdGenerator import VanillatdGenerator
        return VanillatdGenerator()

    if emulator == 'vcmi':
        from generators.vcmi.vcmiGenerator import VcmiGenerator
        return VcmiGenerator()

    if emulator == 'vkquake':
        from generators.vkquake.vkquakeGenerator import VkquakeGenerator
        return VkquakeGenerator()

    if emulator == 'vice':
        from generators.vice.viceGenerator import ViceGenerator
        return ViceGenerator()

    if emulator == 'virtualjaguar':
        from generators.virtualjaguar.virtualjaguarGenerator import VirtualjaguarGenerator
        return VirtualjaguarGenerator()

    if emulator == "vita3k":
        from generators.vita3k.vita3kGenerator import Vita3kGenerator
        return Vita3kGenerator()

    if emulator == 'voidsw':
        from generators.voidsw.voidswGenerator import VoidswGenerator
        return VoidswGenerator()

    if emulator == 'vpinball':
        from generators.vpinball.vpinballGenerator import VPinballGenerator
        return VPinballGenerator()

    if emulator == 'wine':
        from generators.wine.wineGenerator import WineGenerator
        return WineGenerator()

    if emulator == 'witchaven':
        from generators.witchaven.witchavenGenerator import WitchavenGenerator
        return WitchavenGenerator()

    if emulator == 'xash3d_fwgs':
        from generators.xash3d_fwgs.xash3dFwgsGenerator import Xash3dFwgsGenerator
        return Xash3dFwgsGenerator()

    if emulator == 'xboxcloud':
        from generators.xboxcloud.xboxcloudGenerator import XboxcloudGenerator
        return XboxcloudGenerator()

    if emulator == 'xemu':
        from generators.xemu.xemuGenerator import XemuGenerator
        return XemuGenerator()

    if emulator == 'xenia' or emulator == 'xenia-canary':
        from generators.xenia.xeniaGenerator import XeniaGenerator
        return XeniaGenerator()

    if emulator == 'yabasanshiro':
        from generators.yabasanshiro.yabasanshiroGenerator import YabasanshiroGenerator
        return YabasanshiroGenerator()

    if emulator == 'yquake2':
        from generators.yquake2.yquake2Generator import Yquake2Generator
        return Yquake2Generator()

    raise Exception(f"no generator found for emulator {emulator}")
