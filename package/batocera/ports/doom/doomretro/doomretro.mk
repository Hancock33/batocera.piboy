################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 11, 2023
DOOMRETRO_VERSION = d9bd3a3799ac20bbc96036cf6f03b698e5890cab
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
