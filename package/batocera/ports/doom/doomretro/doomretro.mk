################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jul 05, 2024
DOOMRETRO_VERSION = 56267c0b4f06327b8c5860dfb1478037dd51ed53
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
