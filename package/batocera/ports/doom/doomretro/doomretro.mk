################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 11, 2024
DOOMRETRO_VERSION = e36630999f6c0b6d2a755804340c2f04d5500196
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
