################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 03, 2023
DOOMRETRO_VERSION = 44af22f698cebd8521e722a670eba80d0daa7436
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
