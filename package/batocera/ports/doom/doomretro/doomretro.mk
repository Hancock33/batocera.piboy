################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 30, 2024
DOOMRETRO_VERSION = 95db5e3c111f7f2afb3f1f17f0348901eb15d320
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
