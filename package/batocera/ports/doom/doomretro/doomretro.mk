################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jun 13, 2025
DOOMRETRO_VERSION = 9e9dd5d6b06ce674a2d2e93ed45d618ca659025c
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
