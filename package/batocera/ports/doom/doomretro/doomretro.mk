################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on May 15, 2025
DOOMRETRO_VERSION = 81ccf0333ea75aed6e4f88769fada31088f9d908
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
