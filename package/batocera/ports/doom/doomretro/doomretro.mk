################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 04, 2023
DOOMRETRO_VERSION = 93ca17b8502b1a89d76749dedb8f5c23ac140578
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
