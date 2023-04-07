################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 07, 2023
DOOMRETRO_VERSION = 8321108ab93c1c44c96a84efad2adfee6a844bf7
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
