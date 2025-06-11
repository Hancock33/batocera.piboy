################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jun 11, 2025
DOOMRETRO_VERSION = 1795a80c56751515507d16af4db68c253516644d
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
