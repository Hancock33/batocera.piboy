################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jul 12, 2024
DOOMRETRO_VERSION = 452846975121f9a0e549e023746c9cad5d6d2375
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
