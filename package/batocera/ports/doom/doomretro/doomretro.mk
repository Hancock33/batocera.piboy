################################################################################
#
# DOOMRETRO
#
################################################################################
# Version: Commits on May 29, 2022
DOOMRETRO_VERSION = bb55128796fcf8b720e7f2a4ba6f67762bb666f2
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
