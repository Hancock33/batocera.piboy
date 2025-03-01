################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 01, 2025
DOOMRETRO_VERSION = 59e6032a4c85189e02fdbd7a39762892d6b5df1f
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
