################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jul 15, 2025
DOOMRETRO_VERSION = 8f20a52ee82dd4514894e8562ba21a61b0a2d41c
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
