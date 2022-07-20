################################################################################
#
# DOOMRETRO
#
################################################################################
# Version: Commits on Jul 20, 2022
DOOMRETRO_VERSION = a6a11240f3d161fe5bf5519bf4b2bf4b45ec5c88
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
