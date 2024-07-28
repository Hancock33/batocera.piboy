################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jul 28, 2024
DOOMRETRO_VERSION = cf0a2f826b16767ec79a4775787b1090a9624346
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
