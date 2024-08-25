################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 25, 2024
DOOMRETRO_VERSION = 01bf4a1c44e810dcd5297690fd8319cf62c5c414
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
