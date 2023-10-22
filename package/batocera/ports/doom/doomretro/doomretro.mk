################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 22, 2023
DOOMRETRO_VERSION = 2d1d71bc108dfb25ecff2ebf52003f4df7b09d3e
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
