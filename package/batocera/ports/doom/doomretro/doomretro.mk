################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 18, 2024
DOOMRETRO_VERSION = 82a9c0320fb25ac29eb8ba1df6c88adafdea4707
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
