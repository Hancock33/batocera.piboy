################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on May 27, 2024
DOOMRETRO_VERSION = 0d01ecebe6b3e8b41afc340d0ff45e7dda9e6ffc
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
