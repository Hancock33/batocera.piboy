################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 26, 2022
DOOMRETRO_VERSION = 07ef7fa2e7148bbff3137e588b6681d6c1170a35
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
