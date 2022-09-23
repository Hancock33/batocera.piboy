################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 23, 2022
DOOMRETRO_VERSION = 8b7d6fbf2faa8239c1f90438f5878ff4350a44d3
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
