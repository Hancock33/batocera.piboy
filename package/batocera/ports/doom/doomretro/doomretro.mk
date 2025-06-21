################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jun 21, 2025
DOOMRETRO_VERSION = f045ff7a64d26dc9e8ef0084894e45e7563aff11
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
