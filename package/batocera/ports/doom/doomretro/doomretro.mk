################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 21, 2024
DOOMRETRO_VERSION = 5b1391443922d5a8d12657a15343052e06459cfe
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
