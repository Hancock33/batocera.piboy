################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 01, 2026
DOOMRETRO_VERSION = 9274daacac758d12b348061c33fddc0c3105db17
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
