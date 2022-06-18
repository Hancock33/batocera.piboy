################################################################################
#
# DOOMRETRO
#
################################################################################
# Version: Commits on Jun 18, 2022
DOOMRETRO_VERSION = 0b721ee884ee1996eeefb79ea9cbe91e02f05771
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
