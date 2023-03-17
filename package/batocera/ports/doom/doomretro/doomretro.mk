################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 17, 2023
DOOMRETRO_VERSION = 88696bdaf36393483a62c7190f1f1db6e3b1b636
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
