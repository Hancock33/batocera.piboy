################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 19, 2023
DOOMRETRO_VERSION = 34b85b3a374e120c0c03cb18668c845bda5c036b
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
