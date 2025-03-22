################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 21, 2025
DOOMRETRO_VERSION = de401ab5483451152330876bed63ecaca0f96ea5
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
