################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 15, 2023
DOOMRETRO_VERSION = d65fa4fcc9fe004cfd7e9046ca022440ecf33c58
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
