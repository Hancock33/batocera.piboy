################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jun 20, 2025
DOOMRETRO_VERSION = 5ed991beed7e6651c3ce86795498ca9a5af50422
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
