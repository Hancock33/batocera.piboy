################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 28, 2024
DOOMRETRO_VERSION = 9789127b8e01075dc3a8e8d0aec24660981e6c0a
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
