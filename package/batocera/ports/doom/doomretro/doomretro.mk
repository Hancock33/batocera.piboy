################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 12, 2025
DOOMRETRO_VERSION = 817b6b7b9367ea92dea9f3658b1e8768dc25e563
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
