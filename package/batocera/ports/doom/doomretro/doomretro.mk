################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 06, 2022
DOOMRETRO_VERSION = 9c4f45c85ec6fae9fc03a4542617ca914eedd72c
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
