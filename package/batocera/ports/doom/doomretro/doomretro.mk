################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 04, 2024
DOOMRETRO_VERSION = 191109f510914436dbd9211e5f5a9c54f678c344
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
