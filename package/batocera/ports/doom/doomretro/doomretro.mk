################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 30, 2024
DOOMRETRO_VERSION = 885b086a752ebc2956bd76bce2d2b4a943419df8
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
