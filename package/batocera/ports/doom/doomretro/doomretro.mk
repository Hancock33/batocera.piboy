################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 05, 2024
DOOMRETRO_VERSION = 7ae116177e28fa987dcaa94eb7fddef67675ca5f
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
