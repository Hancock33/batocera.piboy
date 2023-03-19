################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 19, 2023
DOOMRETRO_VERSION = d865410c6c70c34e4c9576f7bf0ac7c52cf8014b
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
