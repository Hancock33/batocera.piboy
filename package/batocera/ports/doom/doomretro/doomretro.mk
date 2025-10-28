################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 28, 2025
DOOMRETRO_VERSION = 6f7bbb46c849acd99b514bfab3a292b17b3f0e61
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
