################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on May 30, 2025
DOOMRETRO_VERSION = 1ef0b507e477073ce3392d29b0b393d18ff05149
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
