################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 27, 2024
DOOMRETRO_VERSION = 2a304ba368612c44bece76a5d47efa5ca185e636
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
