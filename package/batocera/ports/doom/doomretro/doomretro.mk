################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on May 17, 2024
DOOMRETRO_VERSION = 88bc9b63dfd77636d1857dd48b960ebd9fc004af
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
