################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 13, 2024
DOOMRETRO_VERSION = f6d5e8a219dd955f801e9e8a3ad8973444637713
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
