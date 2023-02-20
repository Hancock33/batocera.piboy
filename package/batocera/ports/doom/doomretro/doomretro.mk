################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 20, 2023
DOOMRETRO_VERSION = 1a712ff0c601c313de1c58d6d2503be31627841a
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
