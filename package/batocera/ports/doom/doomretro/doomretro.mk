################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 14, 2025
DOOMRETRO_VERSION = 307799831dcbfb2b18247dd0211ff50e5d8dea6e
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
