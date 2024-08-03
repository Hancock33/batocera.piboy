################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 03, 2024
DOOMRETRO_VERSION = 8426274ad5b3d0e671b49dd80ace1789071deddd
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
