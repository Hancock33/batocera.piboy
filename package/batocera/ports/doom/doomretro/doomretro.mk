################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 06, 2023
DOOMRETRO_VERSION = 7081f17aa87f133bb74746a8dab207ada432def5
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
