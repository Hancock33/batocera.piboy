################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jul 12, 2025
DOOMRETRO_VERSION = 17ed2f80c387085acbc44df3016a5ac95e0eee1c
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
