################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 31, 2023
DOOMRETRO_VERSION = 084b7698e4e5926d1240489e0a5868c911feb29f
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
