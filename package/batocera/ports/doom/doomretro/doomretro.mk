################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 28, 2022
DOOMRETRO_VERSION = 152729426db39f3788670ab0555bfac872f79f09
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
