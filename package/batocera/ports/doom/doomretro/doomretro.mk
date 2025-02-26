################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 26, 2025
DOOMRETRO_VERSION = 6623cb6e8900dc425dc03e75a8d1d58618a30801
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
