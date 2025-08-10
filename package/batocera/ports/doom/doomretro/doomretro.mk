################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 10, 2025
DOOMRETRO_VERSION = 659b5eb56977edac66754e42675683539319c48a
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
