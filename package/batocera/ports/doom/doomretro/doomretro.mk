################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 24, 2025
DOOMRETRO_VERSION = d8538e7b8f51f667200913c733cf003edad481ac
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
