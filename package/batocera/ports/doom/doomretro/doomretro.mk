################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 16, 2023
DOOMRETRO_VERSION = f4833d03a143ec59a2a7e97c8b8299a1d302b34e
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
