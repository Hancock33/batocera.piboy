################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 18, 2023
DOOMRETRO_VERSION = 147633e2e1c2e4cbfe32950f9842c3b8dd2731d5
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
