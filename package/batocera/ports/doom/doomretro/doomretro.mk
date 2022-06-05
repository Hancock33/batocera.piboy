################################################################################
#
# DOOMRETRO
#
################################################################################
# Version: Commits on Jun 05, 2022
DOOMRETRO_VERSION = 877435a9a66e93e35ce963d19a4028c14bb16dd2
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
