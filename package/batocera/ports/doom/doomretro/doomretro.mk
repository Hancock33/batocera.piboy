################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 07, 2023
DOOMRETRO_VERSION = b6c99e5fcdb89fc4716f6e18d7791f637e43be0c
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
