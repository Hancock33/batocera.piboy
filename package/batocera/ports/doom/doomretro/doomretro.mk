################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 19, 2024
DOOMRETRO_VERSION = 66a86f7eaa71f1199e972997ddc4d072887f5ed5
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
