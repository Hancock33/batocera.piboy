################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 04, 2022
DOOMRETRO_VERSION = 1299259617f3ca1eb77fbf89ec688a4b2d5036ef
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
