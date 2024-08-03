################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 03, 2024
DOOMRETRO_VERSION = 4048cd5b041ac8fbde1ccced9ca71a56a543047a
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
