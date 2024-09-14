################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 14, 2024
DOOMRETRO_VERSION = 58ca5875a58a090d9cc9950a513b796d0ffb5c63
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
