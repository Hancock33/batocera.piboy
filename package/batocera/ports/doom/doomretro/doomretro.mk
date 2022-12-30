################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 30, 2022
DOOMRETRO_VERSION = 55847e0b23192b5b8b2302cf3bdf5cbe4fa6b256
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
