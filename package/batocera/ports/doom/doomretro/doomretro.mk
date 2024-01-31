################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 31, 2024
DOOMRETRO_VERSION = f1a625f3927fde4c031f4fc4a4f1355217f0d7ff
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
