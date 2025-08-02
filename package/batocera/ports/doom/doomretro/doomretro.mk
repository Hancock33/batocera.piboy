################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 01, 2025
DOOMRETRO_VERSION = 7a6facddad9e6d5e0ef70b25b52367711978a374
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
