################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 09, 2024
DOOMRETRO_VERSION = 6a6064896f909428c4385614b429fb4d8dd10f3c
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
