################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 16, 2023
DOOMRETRO_VERSION = f5f8594152d15bc53714484581cea91f4d54aceb
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
