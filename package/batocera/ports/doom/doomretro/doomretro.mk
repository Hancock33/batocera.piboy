################################################################################
#
# DOOMRETRO
#
################################################################################
# Version: Commits on Jun 12, 2022
DOOMRETRO_VERSION = 50fd910f4bc84d887889e73b11c1648030e63a00
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
