################################################################################
#
# DOOMRETRO
#
################################################################################
# Version: Commits on May 07, 2022
DOOMRETRO_VERSION = b99da36b15f3c2fda20336e55f6efc385117481c
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
