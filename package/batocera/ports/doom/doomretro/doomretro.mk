################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 15, 2025
DOOMRETRO_VERSION = 935eb8e12d2b4053141c3273a360f0d21a7602ba
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
