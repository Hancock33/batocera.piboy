################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 07, 2024
DOOMRETRO_VERSION = 0c100ad6bbe5af45b60430f4fe620ab11f57ca67
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
