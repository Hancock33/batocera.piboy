################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 04, 2024
DOOMRETRO_VERSION = ccac26355e776c106695086d37f29b94e073c710
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
