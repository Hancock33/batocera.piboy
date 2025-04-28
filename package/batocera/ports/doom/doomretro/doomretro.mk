################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 28, 2025
DOOMRETRO_VERSION = eb71b22ace400bb194a09b2c1c3159b950db9518
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
