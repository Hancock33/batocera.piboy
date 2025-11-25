################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 25, 2025
DOOMRETRO_VERSION = aa0ab3b964ae5d616c87f9bd203b975ab48d08ae
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
