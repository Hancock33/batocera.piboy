################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 30, 2022
DOOMRETRO_VERSION = b0a382802985ac4270236c57a9d04975f9686c12
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
