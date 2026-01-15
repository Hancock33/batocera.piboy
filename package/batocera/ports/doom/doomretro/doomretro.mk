################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 15, 2026
DOOMRETRO_VERSION = a270b830351cf834c96674a3aed6e3422cc77b45
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
