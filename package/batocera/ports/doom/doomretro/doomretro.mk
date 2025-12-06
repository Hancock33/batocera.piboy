################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 06, 2025
DOOMRETRO_VERSION = bb405f2527aff4d7e31b465b6af9f7bce7d43724
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
