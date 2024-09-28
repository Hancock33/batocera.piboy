################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 28, 2024
DOOMRETRO_VERSION = 2478c15c60d096ceffb2d32b100dddd586ab35ac
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
