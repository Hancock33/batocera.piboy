################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 11, 2022
DOOMRETRO_VERSION = 95696700842935d3097988deaf3ea68a3c32e1f8
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
