################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 13, 2024
DOOMRETRO_VERSION = 16eee81f321e98c7f47d49bf28c80d795ee8e9b9
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
