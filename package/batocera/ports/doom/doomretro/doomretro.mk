################################################################################
#
# DOOMRETRO
#
################################################################################
# Version: Commits on May 19, 2022
DOOMRETRO_VERSION = 1b6186acd5fdb9e53eb0b778545781f0a195959a
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
