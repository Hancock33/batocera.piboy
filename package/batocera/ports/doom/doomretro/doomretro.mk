################################################################################
#
# DOOMRETRO
#
################################################################################
# Version: Commits on May 29, 2022
DOOMRETRO_VERSION = 876c4c12e6950dbe0950460cd417e3c4ec5accfa
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
