################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 19, 2024
DOOMRETRO_VERSION = 25fa8125cfa7d9a4798b5be09b7a70f446b1ad78
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
