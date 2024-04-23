################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 23, 2024
DOOMRETRO_VERSION = 731a128533f07c85975f26165ed63e10c5126de9
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
