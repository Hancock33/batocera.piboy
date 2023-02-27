################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 27, 2023
DOOMRETRO_VERSION = 193f9e162e18bf9c01d53ec9c0d6fc53096306f7
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
