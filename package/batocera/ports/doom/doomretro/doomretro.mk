################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 12, 2023
DOOMRETRO_VERSION = 3c923d41f724fee1fd14e890151ca40d1bf98c1b
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO
DOOMRETRO_CMAKE_BACKEND = ninja

DOOMRETRO_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release

$(eval $(cmake-package))
