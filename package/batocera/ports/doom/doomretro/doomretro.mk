################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on May 07, 2025
DOOMRETRO_VERSION = e9d3d59853333511f08385a2e5946ba5c80828bf
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
