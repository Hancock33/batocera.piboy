################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jul 13, 2024
DOOMRETRO_VERSION = 211fc6f2604386f5df2eea6d0de209db938a0e45
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
