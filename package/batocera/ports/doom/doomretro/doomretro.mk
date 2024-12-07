################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 07, 2024
DOOMRETRO_VERSION = 4d9437a339a24114764166f864c586019222cbf1
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
