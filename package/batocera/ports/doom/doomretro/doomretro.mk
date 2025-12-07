################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 07, 2025
DOOMRETRO_VERSION = 58d88230cc8991c17eff0eb45f1901bbb5fa3901
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
