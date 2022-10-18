################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 18, 2022
DOOMRETRO_VERSION = e0a65058198777a0a416430321326cd6aa758aee
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
