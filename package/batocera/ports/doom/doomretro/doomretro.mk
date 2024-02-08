################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 08, 2024
DOOMRETRO_VERSION = d1c864567a2df4a80b28da0072ad6069bd1e6c2d
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
