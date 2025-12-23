################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 23, 2025
DOOMRETRO_VERSION = 3d55b626fe6300290a8675bcc117ff896a065969
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
