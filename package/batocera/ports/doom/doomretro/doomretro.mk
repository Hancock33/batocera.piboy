################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 06, 2022
DOOMRETRO_VERSION = 60e7fd6bd209e2add5baa3874d3c5ae43ecc3d71
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
