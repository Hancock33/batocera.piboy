################################################################################
#
# DOOMRETRO
#
################################################################################
# Version: Commits on Jul 03, 2022
DOOMRETRO_VERSION = 17cfa6022ce1360c3330cd81793ba6c38494b863
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
