################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 10, 2023
DOOMRETRO_VERSION = 5ad9c429c3231b4804edd84e8242808a2ec72840
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
