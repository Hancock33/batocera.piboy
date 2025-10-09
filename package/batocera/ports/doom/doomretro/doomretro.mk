################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 09, 2025
DOOMRETRO_VERSION = f2a68e4a0e581aef58b8cdf3a7bbff06628ef404
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
