################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 20, 2026
DOOMRETRO_VERSION = b14d2fd11cd89e2e06099d79937c133f7674f928
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
