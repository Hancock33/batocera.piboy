################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 14, 2024
DOOMRETRO_VERSION = 99c861d794748876342ccba51daca0c69c8f73ad
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
