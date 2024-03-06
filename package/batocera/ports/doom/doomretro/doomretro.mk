################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 06, 2024
DOOMRETRO_VERSION = a02215f44b8286ed19cdc3df0ecbd7f235e9297a
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
