################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 20, 2023
DOOMRETRO_VERSION = 228fdeee24a73adc6971c9e883cc40b16e7d0349
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
