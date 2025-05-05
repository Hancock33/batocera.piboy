################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on May 05, 2025
DOOMRETRO_VERSION = a03d9b86c629f7403891e46972c1f6406fc6d578
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
