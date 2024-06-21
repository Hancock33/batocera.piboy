################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jun 21, 2024
DOOMRETRO_VERSION = 099904b1714370c3bfdbf966117408c455b2d664
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
