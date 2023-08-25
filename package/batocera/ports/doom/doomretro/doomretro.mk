################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 25, 2023
DOOMRETRO_VERSION = 21be2b26eb40ce6d7d23a271cb25de4913fabde0
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
