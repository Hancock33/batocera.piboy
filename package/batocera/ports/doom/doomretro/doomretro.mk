################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 14, 2022
DOOMRETRO_VERSION = 498da4ddc9ad764602c28c437beba795bedd3073
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
