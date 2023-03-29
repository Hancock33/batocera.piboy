################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 29, 2023
DOOMRETRO_VERSION = 3729a38e9fe160ee9a13e8b72108e4eb2b247b43
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
