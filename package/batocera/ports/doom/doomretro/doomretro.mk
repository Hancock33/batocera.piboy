################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 30, 2023
DOOMRETRO_VERSION = f14353250a3b500e30bff23acb4012efc8590e2f
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
