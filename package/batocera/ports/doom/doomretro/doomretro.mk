################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jul 23, 2025
DOOMRETRO_VERSION = 3ec8d1204057348412f9eb9af1e0a5c381e9ab92
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
