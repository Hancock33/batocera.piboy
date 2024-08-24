################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 24, 2024
DOOMRETRO_VERSION = b885639a7a303922dc9aa9d8f528f822b3d89638
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
