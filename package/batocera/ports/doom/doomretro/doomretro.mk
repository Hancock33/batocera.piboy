################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 15, 2024
DOOMRETRO_VERSION = 1a34dff42a25c2dc99953344f0ae433d2cc5d58c
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
