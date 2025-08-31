################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 31, 2025
DOOMRETRO_VERSION = d37220fe2e045ed9201cfc2dc309c7e8f810c66d
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
