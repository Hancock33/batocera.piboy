################################################################################
#
# DOOMRETRO
#
################################################################################
# Version: Commits on May 30, 2022
DOOMRETRO_VERSION = 39b5c84d32fd7afd220ec1ab444f434ce5f770d7
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
