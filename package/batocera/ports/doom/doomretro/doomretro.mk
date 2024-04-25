################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 25, 2024
DOOMRETRO_VERSION = e244d08a6c8d3d8a81c7c652f5636567b590d89c
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
