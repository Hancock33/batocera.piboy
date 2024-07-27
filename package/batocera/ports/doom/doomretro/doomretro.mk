################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jul 27, 2024
DOOMRETRO_VERSION = 518a37a9b0d735e759a6375a0bd2c29b4378a112
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
