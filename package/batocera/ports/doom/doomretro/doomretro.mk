################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 28, 2022
DOOMRETRO_VERSION = e7dc563bfe9a15d77f101a9b750b1c1ecd024c00
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
