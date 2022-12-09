################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 09, 2022
DOOMRETRO_VERSION = 17c7f857484f89e869b31105ad80888094ea981d
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
