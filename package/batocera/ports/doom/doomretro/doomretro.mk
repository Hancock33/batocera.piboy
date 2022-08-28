################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 28, 2022
DOOMRETRO_VERSION = 7f736dde3139220703d65eaa437408f63c6960b8
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
