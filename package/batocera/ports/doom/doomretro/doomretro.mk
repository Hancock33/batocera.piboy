################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 30, 2025
DOOMRETRO_VERSION = c2a4705bf5d643c56cd5e88a7b47721b95fbef0b
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
