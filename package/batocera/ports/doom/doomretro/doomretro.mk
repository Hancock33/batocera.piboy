################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 16, 2023
DOOMRETRO_VERSION = 2efaea138cbe29a2d4c6afbc79b40d2c42004d16
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
