################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 31, 2025
DOOMRETRO_VERSION = 2781acda67443d20ad1777c48f85a858fb3e3984
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
