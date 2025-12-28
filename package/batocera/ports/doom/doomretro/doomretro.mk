################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 28, 2025
DOOMRETRO_VERSION = c27eec6c9672786fecc1003bf4cf0ff4a9eff524
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
