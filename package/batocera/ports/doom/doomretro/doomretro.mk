################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 07, 2025
DOOMRETRO_VERSION = ff72d4eb5f6274548624b911f22e4b9759ee98bf
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
