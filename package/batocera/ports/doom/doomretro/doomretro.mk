################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jul 25, 2024
DOOMRETRO_VERSION = 70c29fcc9bc26c0e5314dc6c0b9765838a5628d5
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
