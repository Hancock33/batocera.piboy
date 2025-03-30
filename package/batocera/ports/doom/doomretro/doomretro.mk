################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 29, 2025
DOOMRETRO_VERSION = ee58b9335e4e9648a3296e16f6074285fb53ef58
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
