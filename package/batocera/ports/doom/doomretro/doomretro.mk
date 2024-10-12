################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 12, 2024
DOOMRETRO_VERSION = ff2bc57f227f6d867a5fc338a91a6320fa422af5
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
