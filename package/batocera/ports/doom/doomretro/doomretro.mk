################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 14, 2022
DOOMRETRO_VERSION = 8fe9dea7b0ee60ecc532059893d981c438350366
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
