################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 10, 2025
DOOMRETRO_VERSION = 6711a195d10ce00d0aab28383dc0c1b76a781619
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
