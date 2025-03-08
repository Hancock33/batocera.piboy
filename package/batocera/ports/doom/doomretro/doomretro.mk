################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 08, 2025
DOOMRETRO_VERSION = 9b0463eab2caebe8444ee717efb1a3ac11719ab9
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
