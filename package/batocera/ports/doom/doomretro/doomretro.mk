################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 09, 2026
DOOMRETRO_VERSION = 0f6dcfec128e16ec9e448cc4f2ce3245f9d9bdbe
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))
DOOMRETRO_EMULATOR_INFO = doomretro.emulator.yml
DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
$(eval $(emulator-info-package))
