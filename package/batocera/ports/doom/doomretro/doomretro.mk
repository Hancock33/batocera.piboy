################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jul 20, 2024
DOOMRETRO_VERSION = 9c4457da2019e6e59c333222a8de4145cf750aeb
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
