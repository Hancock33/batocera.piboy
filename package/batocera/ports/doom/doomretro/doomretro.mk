################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 11, 2024
DOOMRETRO_VERSION = e38fabfb6059254134116a5b9f9664daf74deb7a
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
