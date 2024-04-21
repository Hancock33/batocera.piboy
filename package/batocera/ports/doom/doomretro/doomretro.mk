################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 21, 2024
DOOMRETRO_VERSION = 4a557f2f199d41b0aca1ba59ffd2b924ae682c6b
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
