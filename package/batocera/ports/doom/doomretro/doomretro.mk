################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 25, 2025
DOOMRETRO_VERSION = 5fa3a4249c105859830cb9158af528665720696a
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
