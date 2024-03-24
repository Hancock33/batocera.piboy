################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 24, 2024
DOOMRETRO_VERSION = c8dd4139ac87ed01064ff9faffa005cdfbb87901
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
