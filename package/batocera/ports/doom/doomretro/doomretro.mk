################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 09, 2024
DOOMRETRO_VERSION = 33da296a95684232ede6d1a991c24f99dc0b9d0e
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
