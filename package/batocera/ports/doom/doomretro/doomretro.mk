################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jun 12, 2025
DOOMRETRO_VERSION = 05c1d72d859adcedc572485766f83e7c2e8260d5
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
