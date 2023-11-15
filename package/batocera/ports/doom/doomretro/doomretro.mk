################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 15, 2023
DOOMRETRO_VERSION = 138a2c5ab40c7c49c21c4f7643e863508dfa352b
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
