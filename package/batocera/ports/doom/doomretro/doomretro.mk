################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 17, 2023
DOOMRETRO_VERSION = d8e158efea6a94f7638ac2bade7dae4aae529710
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
