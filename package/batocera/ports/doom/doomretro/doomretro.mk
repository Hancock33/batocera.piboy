################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 27, 2025
DOOMRETRO_VERSION = 9db376659bf29f688c8dd5df447191942d70f017
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
