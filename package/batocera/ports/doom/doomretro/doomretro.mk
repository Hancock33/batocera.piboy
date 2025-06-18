################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jun 18, 2025
DOOMRETRO_VERSION = 72263cec966e4204ccda859f264c5c82ce36c4ff
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
