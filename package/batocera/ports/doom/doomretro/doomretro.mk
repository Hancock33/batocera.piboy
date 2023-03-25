################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 25, 2023
DOOMRETRO_VERSION = d19cfde990158b5484f70e0f6bb8e552c4e29586
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
