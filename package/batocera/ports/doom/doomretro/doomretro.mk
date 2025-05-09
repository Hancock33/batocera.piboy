################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on May 09, 2025
DOOMRETRO_VERSION = 3f27a38bc1c1597cb0c7aad4a215261071f550c2
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
