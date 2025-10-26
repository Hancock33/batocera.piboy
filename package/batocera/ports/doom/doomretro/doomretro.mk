################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 26, 2025
DOOMRETRO_VERSION = 17bb1b0cb9f8f2d88e7a38ce536f5942c554077f
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
