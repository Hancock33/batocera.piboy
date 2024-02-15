################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 15, 2024
DOOMRETRO_VERSION = 18ff24fa2c8844ef1373ea36fc7060effaa2be84
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
