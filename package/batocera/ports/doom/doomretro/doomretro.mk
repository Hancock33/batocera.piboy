################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 04, 2025
DOOMRETRO_VERSION = 1c7afd683826129b91285d73b48fa982e3cfa826
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
