################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 04, 2023
DOOMRETRO_VERSION = 7936c3cbe3cbcce81b95a3088bd18943dae6360f
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
