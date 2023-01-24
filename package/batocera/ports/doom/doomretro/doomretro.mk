################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 24, 2023
DOOMRETRO_VERSION = a2ebf329b320c4f0cb53515f70f788dc86beec8d
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
