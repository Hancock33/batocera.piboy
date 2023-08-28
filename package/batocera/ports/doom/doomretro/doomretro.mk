################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 28, 2023
DOOMRETRO_VERSION = 1c32ba4dc77f8266c859669bf3d399d1a50158e2
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
