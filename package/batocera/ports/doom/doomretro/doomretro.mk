################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 21, 2024
DOOMRETRO_VERSION = bffe3a33bb925a03313aa3bd6a2c4885df8de693
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
