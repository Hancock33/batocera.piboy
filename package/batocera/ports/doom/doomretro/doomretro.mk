################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 26, 2026
DOOMRETRO_VERSION = 14c6d7f7d9918b4aa969b6a7438c2d2bf592bb92
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
