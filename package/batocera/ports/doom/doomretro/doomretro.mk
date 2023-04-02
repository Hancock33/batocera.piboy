################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 02, 2023
DOOMRETRO_VERSION = 1af07907df52d7b8546e1012019f680840de386d
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
