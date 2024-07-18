################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jul 18, 2024
DOOMRETRO_VERSION = 2419752489e5e5a28b4081c58db06ca2d525fc13
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
