################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 20, 2024
DOOMRETRO_VERSION = 445e2c363cd9932cce12c8199a4269e28399933b
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
