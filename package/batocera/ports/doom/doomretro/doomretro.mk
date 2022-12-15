################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 15, 2022
DOOMRETRO_VERSION = fccdb44e8f34477f9cec2a061dcbe70af390e116
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
