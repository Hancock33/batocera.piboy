################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 11, 2025
DOOMRETRO_VERSION = 6d873efb4c0e52678d1028ea28fcf895e295882f
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
