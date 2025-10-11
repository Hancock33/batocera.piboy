################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 11, 2025
DOOMRETRO_VERSION = 9e43172aee84934bb9ab5eb0e1b6bf603f8a96d8
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
