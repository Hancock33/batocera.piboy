################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 08, 2024
DOOMRETRO_VERSION = a4407c00bd069288a30b926a89ca769202576f9d
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
