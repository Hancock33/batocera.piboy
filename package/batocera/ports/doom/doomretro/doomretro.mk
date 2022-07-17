################################################################################
#
# DOOMRETRO
#
################################################################################
# Version: Commits on Jul 17, 2022
DOOMRETRO_VERSION = 9d004c1107c9eb143e250a99ac9908b4dd28b16e
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
