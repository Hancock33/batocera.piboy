################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jun 09, 2024
DOOMRETRO_VERSION = 5d74b0eb36d3da77e0d1d4deedf04788151be1ec
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
