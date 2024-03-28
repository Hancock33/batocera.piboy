################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 28, 2024
DOOMRETRO_VERSION = 8a7e1c874768328b4e34d1a4b48d8c92be0b5f80
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
