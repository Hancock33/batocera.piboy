################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 01, 2022
DOOMRETRO_VERSION = f0503401f6133a18aeeba18dcb0c029ba9aaa8f3
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
