################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 16, 2024
DOOMRETRO_VERSION = 75bf3e6f1ae55d1719c01b474d263e7fceb3786e
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
