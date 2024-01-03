################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 03, 2024
DOOMRETRO_VERSION = 86d9b0909c7b8148898e8ddb25264e5c67782fae
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
