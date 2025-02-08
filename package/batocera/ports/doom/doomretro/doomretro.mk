################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 08, 2025
DOOMRETRO_VERSION = 59cff7702dc672aa5d07706022773aff46aabbef
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
