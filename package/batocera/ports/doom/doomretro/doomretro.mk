################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 31, 2022
DOOMRETRO_VERSION = d05ab5f878e8258037d80f05df10d8a7c32b7329
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
