################################################################################
#
# DOOMRETRO
#
################################################################################
# Version: Commits on May 06, 2022
DOOMRETRO_VERSION = cd3e3c09f42f9eca83c4498ef84366b4dd37f0ab
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
