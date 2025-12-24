################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 24, 2025
DOOMRETRO_VERSION = 9002c779219b0fcd0260b9dcd4a0de75e74bc9a7
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
