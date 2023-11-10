################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 10, 2023
DOOMRETRO_VERSION = bc711851ced87d53412ca2560193810a1ac6a851
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
