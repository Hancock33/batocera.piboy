################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 05, 2026
DOOMRETRO_VERSION = 90b7148f946df253c3e85aa59eb73a44d0c0c696
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
