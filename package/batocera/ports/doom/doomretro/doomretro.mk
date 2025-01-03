################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 03, 2025
DOOMRETRO_VERSION = 3dd65c262c178fecc28de0cfb6761fbf8a5f358b
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
