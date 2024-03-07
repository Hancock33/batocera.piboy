################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 07, 2024
DOOMRETRO_VERSION = 73f15d24fc1f036f4a0f48a769039e93e28b1cd3
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
