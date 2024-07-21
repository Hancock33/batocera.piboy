################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jul 21, 2024
DOOMRETRO_VERSION = 2b2cfc8e392f27b232f85fc224ab4735ac2fbdab
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
