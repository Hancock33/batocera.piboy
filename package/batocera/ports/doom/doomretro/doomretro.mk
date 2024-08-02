################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 02, 2024
DOOMRETRO_VERSION = 26600867f840a35952068dc81e7626027f3b63ff
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
