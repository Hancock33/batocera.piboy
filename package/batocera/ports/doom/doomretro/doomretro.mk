################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 18, 2025
DOOMRETRO_VERSION = 28b918879b0e3b3428ac09f41c0129296b037b2d
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
