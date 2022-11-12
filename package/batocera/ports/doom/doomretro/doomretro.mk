################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 12, 2022
DOOMRETRO_VERSION = f0c9081dc6363a2289993616cbafbebc5bd6fd12
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
