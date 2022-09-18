################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 18, 2022
DOOMRETRO_VERSION = 5dfd45756cccb69df2f2bc4ca384f35a15bdf930
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
