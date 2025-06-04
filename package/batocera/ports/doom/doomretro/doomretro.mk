################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jun 04, 2025
DOOMRETRO_VERSION = 5faa0e2cf08cc169bde5cf1756b6201c1a88416a
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
