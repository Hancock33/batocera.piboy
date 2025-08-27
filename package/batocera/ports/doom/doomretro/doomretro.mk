################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 27, 2025
DOOMRETRO_VERSION = 4c3758a0f5fc92027246343c165126b6b6c5e3fc
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
