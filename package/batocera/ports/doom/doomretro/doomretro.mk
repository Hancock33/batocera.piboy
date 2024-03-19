################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 19, 2024
DOOMRETRO_VERSION = 1102e3bea80b0f7d844d7c769fc88b9cfa75138a
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
