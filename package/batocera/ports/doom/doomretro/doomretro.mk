################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 29, 2022
DOOMRETRO_VERSION = 4d14dc9745d1359db66672b46337193659419ac1
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
