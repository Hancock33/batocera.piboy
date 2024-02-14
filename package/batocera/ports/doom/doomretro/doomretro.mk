################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 14, 2024
DOOMRETRO_VERSION = 7e86f55e92b48682b5b8f64a05b65108e0fa4507
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
