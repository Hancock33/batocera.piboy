################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 04, 2023
DOOMRETRO_VERSION = dcc904b2a052bf5424e536de65889d4e4bf4c21a
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
