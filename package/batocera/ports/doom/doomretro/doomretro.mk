################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 09, 2023
DOOMRETRO_VERSION = 2c441f4fc4a021af32359abe2ce75e13e42214cb
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
