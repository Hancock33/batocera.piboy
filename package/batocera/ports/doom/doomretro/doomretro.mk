################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 11, 2023
DOOMRETRO_VERSION = dca6df5cb3e9cb660df82a05b997a221816a1029
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
