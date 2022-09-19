################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 19, 2022
DOOMRETRO_VERSION = 5e18d2adc30d96fd32b1415889a4df2b293d0cfc
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
