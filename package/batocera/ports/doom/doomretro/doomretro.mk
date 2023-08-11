################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 11, 2023
DOOMRETRO_VERSION = 1d573d19bba5dca021af9806ec0db8d9748a0d46
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO
DOOMRETRO_CMAKE_BACKEND = ninja

DOOMRETRO_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release

$(eval $(cmake-package))
