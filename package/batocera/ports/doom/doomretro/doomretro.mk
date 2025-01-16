################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 16, 2025
DOOMRETRO_VERSION = 25455cb7c67c7d20368d7e7b284c6eb084d18ec1
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
