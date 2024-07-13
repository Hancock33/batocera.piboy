################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jul 13, 2024
DOOMRETRO_VERSION = 84853a9e02b04d861756af6aa12ea280b475203c
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
