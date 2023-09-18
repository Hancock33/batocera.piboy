################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 18, 2023
DOOMRETRO_VERSION = abb4eb5c4dce5942cc78895cdbf0c741b32d89c1
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
