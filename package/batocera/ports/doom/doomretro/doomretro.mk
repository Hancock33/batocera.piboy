################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 08, 2025
DOOMRETRO_VERSION = f29cd887f9267edc606548c0de694f2844b0e3c9
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
