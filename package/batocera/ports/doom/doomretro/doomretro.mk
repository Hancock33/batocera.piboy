################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 18, 2022
DOOMRETRO_VERSION = 020c9f83b40ef8dda9a6fee3dc4243a4252d0ec6
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
