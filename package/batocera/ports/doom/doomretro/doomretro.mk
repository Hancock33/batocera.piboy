################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 05, 2023
DOOMRETRO_VERSION = 7096524b7755087859071c74589250927869309c
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
