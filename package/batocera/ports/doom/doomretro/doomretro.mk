################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 25, 2024
DOOMRETRO_VERSION = 56cf6d6e0caa8a19fba395000bf9c1225e0cda57
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
