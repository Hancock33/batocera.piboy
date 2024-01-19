################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 19, 2024
DOOMRETRO_VERSION = 15b3bcf18ab49156cb998afb5620e3737dd72d4a
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
