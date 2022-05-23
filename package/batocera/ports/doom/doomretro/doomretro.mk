################################################################################
#
# DOOMRETRO
#
################################################################################
# Version: Commits on May 23, 2022
DOOMRETRO_VERSION = 18b4729694e0ea0abd05f8b8e3a6735f89e24b84
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
