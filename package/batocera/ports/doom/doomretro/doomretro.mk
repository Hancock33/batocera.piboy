################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 27, 2024
DOOMRETRO_VERSION = 9a51a8a94e0616b5d8bfdc47c5c4211faf9c5842
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
