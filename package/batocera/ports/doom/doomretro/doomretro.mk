################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 28, 2024
DOOMRETRO_VERSION = 39cce58e106ba896978401cc02f7c18aa0fc9383
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
