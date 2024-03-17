################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 17, 2024
DOOMRETRO_VERSION = 0fe66a3979e39f67164db7542bc8d7c40913f5f4
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
