################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 25, 2023
DOOMRETRO_VERSION = b3f10bab6267ff96cdc02e5e8b705eba4b48ed30
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
