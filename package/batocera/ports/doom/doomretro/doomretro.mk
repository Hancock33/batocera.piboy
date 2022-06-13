################################################################################
#
# DOOMRETRO
#
################################################################################
# Version: Commits on Jun 13, 2022
DOOMRETRO_VERSION = 881eabfc51027e6951dcb9aebd0c3519e2507e04
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
