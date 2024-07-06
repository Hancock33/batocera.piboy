################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jul 06, 2024
DOOMRETRO_VERSION = 760b592a1ef13f8a99600fd9fd90430c16fbaae7
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
