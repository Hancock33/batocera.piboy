################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 21, 2025
DOOMRETRO_VERSION = 2320bd3056c7304197d7b646a51a9d1504de6f66
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
