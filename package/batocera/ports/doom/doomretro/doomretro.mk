################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 15, 2025
DOOMRETRO_VERSION = ebd1a47071ec58b4a1b36343e2af07d4566eb45f
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
