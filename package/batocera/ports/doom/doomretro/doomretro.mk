################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 10, 2024
DOOMRETRO_VERSION = 4b089feb9bf5145a420071c6094aa539812e4b75
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
