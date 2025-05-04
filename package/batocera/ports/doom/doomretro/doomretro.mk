################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on May 04, 2025
DOOMRETRO_VERSION = 9b8d10aa844edad8da3a4c39608f2cc0486badb5
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
