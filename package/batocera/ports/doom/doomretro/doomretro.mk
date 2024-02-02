################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 02, 2024
DOOMRETRO_VERSION = 76541bfaaefb7bfbde9c46b71b2896fbdac32433
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
