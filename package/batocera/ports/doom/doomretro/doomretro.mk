################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 06, 2023
DOOMRETRO_VERSION = 34c246b3e7aa0ea9052534a1a86b26c3ef9b060c
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
