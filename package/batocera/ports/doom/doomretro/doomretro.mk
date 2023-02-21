################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 21, 2023
DOOMRETRO_VERSION = efe486b2cde101de18e3a357846bb57e92bb28dc
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
