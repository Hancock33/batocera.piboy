################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 27, 2024
DOOMRETRO_VERSION = 5f12137b2e5bf90fffea43f3571bc9f87706cd66
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
