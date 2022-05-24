################################################################################
#
# DOOMRETRO
#
################################################################################
# Version: Commits on May 24, 2022
DOOMRETRO_VERSION = 02a266dff3715cf1873e37524f33638a89664a59
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
