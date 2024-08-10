################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 10, 2024
DOOMRETRO_VERSION = 1d387567d4bf1ca05d28ade560c47e75d533f956
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
