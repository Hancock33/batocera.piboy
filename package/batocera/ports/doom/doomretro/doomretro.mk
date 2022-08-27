################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 27, 2022
DOOMRETRO_VERSION = 3bb06cac4e60a36bea2cb403cdf33a191ddf4211
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
