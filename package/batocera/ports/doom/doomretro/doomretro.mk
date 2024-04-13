################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 13, 2024
DOOMRETRO_VERSION = c1d59a9b82a3b52b317b6b58c39cfa45363581e8
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
