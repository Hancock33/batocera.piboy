################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 29, 2024
DOOMRETRO_VERSION = fb1e61c94cd87331e470ecd53d5ef712193c23a5
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
