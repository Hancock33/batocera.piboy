################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 23, 2023
DOOMRETRO_VERSION = f02271e0b9b0259247210d3b1a593d973075bbc7
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
