################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 16, 2026
DOOMRETRO_VERSION = 3ae300130e2508feded254c4bea647bf44a2c9d5
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
