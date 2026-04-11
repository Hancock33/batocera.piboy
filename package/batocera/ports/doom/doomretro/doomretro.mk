################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 11, 2026
DOOMRETRO_VERSION = dd3f9daeb1621361de95e0c0d53ed53e35b5a794
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))
DOOMRETRO_EMULATOR_INFO = doomretro.emulator.yml
DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
$(eval $(emulator-info-package))
