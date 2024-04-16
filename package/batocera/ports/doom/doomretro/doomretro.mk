################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 16, 2024
DOOMRETRO_VERSION = 2c6a0a8a9d7f90c5a20106e92e3b35e7b8db86d1
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
