################################################################################
#
# DOOMRETRO
#
################################################################################
# Version: Commits on Jul 09, 2022
DOOMRETRO_VERSION = 2f534709d3d9755f09f7e8594e42ee57a721f66c
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
