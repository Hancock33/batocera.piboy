################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 09, 2023
DOOMRETRO_VERSION = 6da563c6a3ce2ee0e7d08794358a53a3f7f5fd5a
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
