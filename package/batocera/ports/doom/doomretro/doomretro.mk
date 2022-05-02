################################################################################
#
# DOOMRETRO
#
################################################################################
# Version: Commits on May 02, 2022
DOOMRETRO_VERSION = e41ff9e691e1252edc7219deecab026b7fde9198
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
