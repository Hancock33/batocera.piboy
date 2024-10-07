################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 07, 2024
DOOMRETRO_VERSION = b2356f5ee756bc100754e110c16d36e74cd10599
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
