################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 28, 2023
DOOMRETRO_VERSION = 882537b3fd86e7cf5c466b864feb8ac9344ec8a9
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
