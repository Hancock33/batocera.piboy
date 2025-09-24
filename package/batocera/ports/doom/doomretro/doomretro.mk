################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 24, 2025
DOOMRETRO_VERSION = 1d4d55b216ffa5ea1932209abe0594f3806c8ca6
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
