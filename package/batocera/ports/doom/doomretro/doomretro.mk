################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 19, 2025
DOOMRETRO_VERSION = 77018513f032125b3f57f2d4bfd5f82b4888c29c
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
