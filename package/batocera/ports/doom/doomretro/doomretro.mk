################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 19, 2025
DOOMRETRO_VERSION = 5f006a91accff759ba335dbb64db0eff531f45c1
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
