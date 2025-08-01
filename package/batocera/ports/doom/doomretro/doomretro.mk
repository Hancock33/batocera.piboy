################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 01, 2025
DOOMRETRO_VERSION = 8ceeebd069f8df3d3192b07b5e7e438cc0cc0403
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
