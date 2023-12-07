################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 07, 2023
DOOMRETRO_VERSION = e20b3574468978fd12128c490648dcd07406bf17
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
