################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 23, 2025
DOOMRETRO_VERSION = 73847b6d9d39e3eac15ca80e2356a489fd0f1d1b
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
