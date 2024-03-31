################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 31, 2024
DOOMRETRO_VERSION = 9789e5075460b68c584a80194db2f1aa3958cb94
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
