################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jun 29, 2024
DOOMRETRO_VERSION = 7c441679095fc876f930f57b7c25ef0982579e4f
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
