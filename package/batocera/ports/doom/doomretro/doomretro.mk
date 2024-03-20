################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 20, 2024
DOOMRETRO_VERSION = 10cd7931cc18fcb0371e500c2366db4625c1d69e
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
