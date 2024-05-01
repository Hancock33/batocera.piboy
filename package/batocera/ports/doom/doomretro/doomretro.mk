################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on May 01, 2024
DOOMRETRO_VERSION = c392130c7be1e8f74369861daf8e69b9928931e7
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
