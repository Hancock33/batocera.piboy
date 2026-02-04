################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 04, 2026
DOOMRETRO_VERSION = 9691acbc6447469a04a32a4dfc9ac7ad68ffb34c
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
