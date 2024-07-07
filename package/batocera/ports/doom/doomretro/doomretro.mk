################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jul 07, 2024
DOOMRETRO_VERSION = fe43ebdf08c5684d834144eb44cf8defefd6063b
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
