################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 23, 2023
DOOMRETRO_VERSION = 8e9d2115b00127a03b704fc5b0c11d0989bb1865
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
