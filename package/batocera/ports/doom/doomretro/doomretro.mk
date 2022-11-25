################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 25, 2022
DOOMRETRO_VERSION = 2324730d8772f3dc52200900e7b0db0bb2c3c118
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
