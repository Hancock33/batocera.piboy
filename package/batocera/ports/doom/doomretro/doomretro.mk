################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 20, 2023
DOOMRETRO_VERSION = ef780c1739e41b56fad9928f394470c6d71be1e1
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
