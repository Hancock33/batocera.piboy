################################################################################
#
# DOOMRETRO
#
################################################################################
# Version: Commits on Jun 16, 2022
DOOMRETRO_VERSION = 0dcf4d0c24dd9e73b18bdd2465b5c4ce32a6c6d7
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
