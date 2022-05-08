################################################################################
#
# DOOMRETRO
#
################################################################################
# Version: Commits on May 08, 2022
DOOMRETRO_VERSION = 7615f4ca17199b68d1138ca70fcf47f128f6504e
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
