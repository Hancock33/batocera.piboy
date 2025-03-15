################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 15, 2025
DOOMRETRO_VERSION = f266876f5df3db9d4406297a5e7888e7c3975df4
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
