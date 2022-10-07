################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 07, 2022
DOOMRETRO_VERSION = d125476e23daa35b44d5e021e17c151d49b63801
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
