################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 19, 2023
DOOMRETRO_VERSION = 7944fbdbd22fb21bbf02069322f60d58a3ce740e
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
