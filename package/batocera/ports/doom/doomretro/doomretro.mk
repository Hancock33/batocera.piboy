################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 20, 2025
DOOMRETRO_VERSION = 01d3626f40986f6339fdd3c2f8dabda4a08e52f1
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
