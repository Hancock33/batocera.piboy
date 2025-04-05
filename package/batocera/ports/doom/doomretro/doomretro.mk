################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 04, 2025
DOOMRETRO_VERSION = c25d9fdb51c4a7e6e36cf6f69ef98b679893f33d
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
