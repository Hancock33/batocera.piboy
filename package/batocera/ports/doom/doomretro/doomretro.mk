################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 05, 2025
DOOMRETRO_VERSION = 8213c3c140db81d5a13857a4604c7786759c0b0a
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
