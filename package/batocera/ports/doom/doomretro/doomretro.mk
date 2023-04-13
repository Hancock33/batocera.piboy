################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 13, 2023
DOOMRETRO_VERSION = 567f9311f6c81b0bcbfc3b3929b5a6cd183e0e49
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
