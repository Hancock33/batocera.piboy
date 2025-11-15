################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 15, 2025
DOOMRETRO_VERSION = 89fa4762ffb93956caeed4306cc7c08859cb2b7e
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
