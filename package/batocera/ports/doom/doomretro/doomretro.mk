################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 25, 2025
DOOMRETRO_VERSION = 58819f02c66c33ac436a7c827c96fc791ffb4f14
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
