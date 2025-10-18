################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 18, 2025
DOOMRETRO_VERSION = f75718b35a4fa443f23a44c15ab554c40d24c4c3
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
