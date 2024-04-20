################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 20, 2024
DOOMRETRO_VERSION = 027708c42dea3158430dc971ec5d0b86e9eb8fde
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
