################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on May 29, 2025
DOOMRETRO_VERSION = d2659d019c667b672ef3f5c56dc6145fac83df9c
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
