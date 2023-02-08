################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 08, 2023
DOOMRETRO_VERSION = 0aecd250c0939b78d3952269d58112cfb208b4a3
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
