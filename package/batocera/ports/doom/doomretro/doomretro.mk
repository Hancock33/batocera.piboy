################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 02, 2024
DOOMRETRO_VERSION = 04449b6f5603f8fb4d542ed37d3d069c2d440998
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
