################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 05, 2025
DOOMRETRO_VERSION = e37c293a8255b88fdf971d6ce5836a7078027d91
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
