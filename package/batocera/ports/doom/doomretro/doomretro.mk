################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 27, 2024
DOOMRETRO_VERSION = 0d6866b63ee95d988d2dc160ecf314e19cb69f72
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
