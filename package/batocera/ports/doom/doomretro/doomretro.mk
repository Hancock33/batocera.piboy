################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on May 25, 2024
DOOMRETRO_VERSION = cf494cb38a55306b8e17a754d5ccdf5f9b4d6fbb
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
