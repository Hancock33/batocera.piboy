################################################################################
#
# DOOMRETRO
#
################################################################################
# Version: Commits on May 14, 2022
DOOMRETRO_VERSION = d0c9449c51f9fcc94af852e9e3f78e6fa6288f86
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
