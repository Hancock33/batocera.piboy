################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 22, 2023
DOOMRETRO_VERSION = fbe9a4fb9aa2290edbc850a25cd326e3d6f3d1e1
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
