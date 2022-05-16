################################################################################
#
# DOOMRETRO
#
################################################################################
# Version: Commits on May 16, 2022
DOOMRETRO_VERSION = 82bfaf9977f4f47fe7664a543f43f63e418e1c23
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
