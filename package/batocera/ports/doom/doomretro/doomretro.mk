################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 13, 2025
DOOMRETRO_VERSION = 6788a780439384f784b49737471e50011f73314d
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
