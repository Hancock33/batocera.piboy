################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 17, 2023
DOOMRETRO_VERSION = a31c5db9f069cfa8c35cb87d742f1e9c5b351949
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
