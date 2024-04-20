################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 20, 2024
DOOMRETRO_VERSION = bdbe238eed97da0b26a3d33afcf1fa0d7afb3123
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
