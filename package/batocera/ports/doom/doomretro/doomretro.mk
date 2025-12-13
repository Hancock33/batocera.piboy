################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 13, 2025
DOOMRETRO_VERSION = 98e7d0102739d28673dc99240243d0d302e389af
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
