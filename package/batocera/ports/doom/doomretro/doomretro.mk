################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 03, 2023
DOOMRETRO_VERSION = 9d5a69f49c3d8857aa96ec90471c39671e421512
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
