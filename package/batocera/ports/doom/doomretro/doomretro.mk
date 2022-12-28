################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 27, 2022
DOOMRETRO_VERSION = 11af2b7342b6de0db5dfd93c5a53aa75ded8b118
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
