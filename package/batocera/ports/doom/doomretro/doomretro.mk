################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 10, 2024
DOOMRETRO_VERSION = 116d35316fd14f08b1b5692ff4d6589059c38e0c
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
