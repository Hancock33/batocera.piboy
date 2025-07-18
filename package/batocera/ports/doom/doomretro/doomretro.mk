################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jul 18, 2025
DOOMRETRO_VERSION = 38933f227cc1074ff39825cb9a9436ad4a91a0d5
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
