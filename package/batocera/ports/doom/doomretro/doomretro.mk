################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on May 22, 2025
DOOMRETRO_VERSION = 8a558a4bbe8404847aad58ec7947b9b3ad8534f7
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
