################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 21, 2025
DOOMRETRO_VERSION = 2d10f50bd50e75214a63b0e1b3bce00335b27b69
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
