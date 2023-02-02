################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 02, 2023
DOOMRETRO_VERSION = 05a1a8703b9ab1255f891c18333b1c23ab5972e4
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
