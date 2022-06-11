################################################################################
#
# DOOMRETRO
#
################################################################################
# Version: Commits on Jun 11, 2022
DOOMRETRO_VERSION = 80117beeb1192e31f9213c0ba303fe87477694bd
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
