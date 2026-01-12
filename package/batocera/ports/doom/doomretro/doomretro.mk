################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 12, 2026
DOOMRETRO_VERSION = 265f0829c65d022559950e019b4c6f14cb6056a8
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
