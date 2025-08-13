################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 13, 2025
DOOMRETRO_VERSION = f7175d898db48a593ca585a41b53ec21621d7137
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
