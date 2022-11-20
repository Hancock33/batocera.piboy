################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 20, 2022
DOOMRETRO_VERSION = 839958c0b9bf1611311f226a8e95cebc53b44083
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
