################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 25, 2025
DOOMRETRO_VERSION = 4e7a48d8e15c3f71d25cc8fee13c69ae7cd610ca
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
