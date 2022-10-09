################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 09, 2022
DOOMRETRO_VERSION = 45d97f4a32df344e305c8783859476f7034f992b
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
