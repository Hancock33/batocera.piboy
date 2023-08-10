################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 10, 2023
DOOMRETRO_VERSION = 277aa411da64b6577ca3a9e0c340ed369dd8b79e
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO
DOOMRETRO_CMAKE_BACKEND = ninja

DOOMRETRO_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release

$(eval $(cmake-package))
