################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on May 11, 2024
DOOMRETRO_VERSION = 24e9b3d24d17d07f6e118524b634f3fe7ea49ad8
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
