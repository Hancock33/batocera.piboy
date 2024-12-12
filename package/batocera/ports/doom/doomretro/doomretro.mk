################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 12, 2024
DOOMRETRO_VERSION = d2c20d34fc8b088bc4371bea12a8f26e1d5eca00
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
