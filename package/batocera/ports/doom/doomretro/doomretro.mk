################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 19, 2023
DOOMRETRO_VERSION = af6f1a65d910a03869a02a65104a6d8b8613acd2
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
