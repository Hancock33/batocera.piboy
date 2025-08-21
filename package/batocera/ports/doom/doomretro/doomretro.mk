################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 20, 2025
DOOMRETRO_VERSION = 00366a769ee980bb0da77f70804f1ab6eae39def
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
