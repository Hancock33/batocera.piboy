################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 14, 2024
DOOMRETRO_VERSION = 248bca4bdc1df462f64512e2b066c274b3841241
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
