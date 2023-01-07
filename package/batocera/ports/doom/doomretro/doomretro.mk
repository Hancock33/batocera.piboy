################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 07, 2023
DOOMRETRO_VERSION = fc9f9dbb6fdc87983eb069377c907e71811219ef
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
