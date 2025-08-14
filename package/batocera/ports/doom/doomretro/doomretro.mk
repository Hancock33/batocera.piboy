################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 14, 2025
DOOMRETRO_VERSION = 41263e563eb9f3e352114c8241f18f362e1de47f
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
