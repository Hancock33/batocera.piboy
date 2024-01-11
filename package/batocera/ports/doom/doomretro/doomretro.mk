################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 11, 2024
DOOMRETRO_VERSION = 44660bcbb59f552f290456be82c8866e1f7bd384
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
