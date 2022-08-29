################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 29, 2022
DOOMRETRO_VERSION = 39e66db1808b68bc4bad51a4458ea7ae6e0ad150
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
