################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 24, 2023
DOOMRETRO_VERSION = e796794b5d46975e589ff1710b2a6a9a45668d34
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
