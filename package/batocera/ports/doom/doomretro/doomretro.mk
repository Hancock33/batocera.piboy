################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 07, 2022
DOOMRETRO_VERSION = f53d031822162f1dc6cc233b43f6817497ff217c
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
