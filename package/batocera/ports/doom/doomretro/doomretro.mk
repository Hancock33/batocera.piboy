################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 09, 2024
DOOMRETRO_VERSION = e00aa6d9c97629b1a91ceb2c65b748bd89dd33f6
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
