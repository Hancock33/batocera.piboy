################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 05, 2023
DOOMRETRO_VERSION = b0e34afba1201ad9bd3bea162ba6207525e7ae88
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
