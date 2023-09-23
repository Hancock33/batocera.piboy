################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 23, 2023
DOOMRETRO_VERSION = 53b03dd50c70b65f19f3c18b4a582e096e492e1a
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
