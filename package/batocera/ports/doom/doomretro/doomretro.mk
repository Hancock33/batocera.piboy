################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 02, 2025
DOOMRETRO_VERSION = c2e3514c66d2f8ea81ad55b2cd3c9f3084546421
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
