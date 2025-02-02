################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 02, 2025
DOOMRETRO_VERSION = 0b850dd08b20f2fe539c81118295f6a1cd68f602
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
