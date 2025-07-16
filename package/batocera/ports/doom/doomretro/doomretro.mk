################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jul 16, 2025
DOOMRETRO_VERSION = 804902c4602b65e5c04ab3eb02994b2df5ed1374
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
