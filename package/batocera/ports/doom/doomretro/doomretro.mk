################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 15, 2024
DOOMRETRO_VERSION = 21107b4a6e6fc635fa1b1803539c04db62c151a5
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
