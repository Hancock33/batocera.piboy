################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 06, 2024
DOOMRETRO_VERSION = 19b6e050ba02a5bdbaf2f56a27fbf7c30de92b17
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
