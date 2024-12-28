################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 28, 2024
DOOMRETRO_VERSION = 1eefb9746fa71287bfdab5fb4e961d0d90cb4c5e
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
