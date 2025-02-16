################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 15, 2025
DOOMRETRO_VERSION = dea2067c86ddd118f0b8927f68d3cd6aa58941f5
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
