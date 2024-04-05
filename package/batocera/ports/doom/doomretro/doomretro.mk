################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 05, 2024
DOOMRETRO_VERSION = 3f95b2797af008ae6847c352de8c10ba1903ed7b
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
