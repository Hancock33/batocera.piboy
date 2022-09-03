################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 03, 2022
DOOMRETRO_VERSION = 7258cc83e1393aae82fac3a9cd885c87913999e8
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
