################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 28, 2023
DOOMRETRO_VERSION = 1b32d1b1a621f7a38f0af34ae5f976a423374741
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
