################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 18, 2023
DOOMRETRO_VERSION = e21c54034944ce3ccad703a6452d088f8926afad
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
