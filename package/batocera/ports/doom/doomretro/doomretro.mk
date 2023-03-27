################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 26, 2023
DOOMRETRO_VERSION = 11412710dd832d135b7d13f022be2b6ecbb40604
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
