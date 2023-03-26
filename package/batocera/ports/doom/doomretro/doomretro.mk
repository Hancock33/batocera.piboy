################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 26, 2023
DOOMRETRO_VERSION = e361e255503707ae0dccc032c30cec5b884c3d27
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
