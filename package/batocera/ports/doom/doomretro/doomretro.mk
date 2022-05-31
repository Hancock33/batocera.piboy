################################################################################
#
# DOOMRETRO
#
################################################################################
# Version: Commits on May 31, 2022
DOOMRETRO_VERSION = 0ef2a651c7a45806479948dc60dd7b1edca933fa
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
