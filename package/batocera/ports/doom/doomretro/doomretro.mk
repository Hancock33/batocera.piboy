################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 23, 2025
DOOMRETRO_VERSION = 4da8df39c311386c6e7fd6f36c4dcbdfe6cd458e
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
