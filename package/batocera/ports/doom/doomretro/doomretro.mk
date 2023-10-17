################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 17, 2023
DOOMRETRO_VERSION = 62d59a0267320f9688856ff0a6b97b5a6c0a5fc1
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
