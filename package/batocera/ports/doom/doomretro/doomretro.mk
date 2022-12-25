################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 25, 2022
DOOMRETRO_VERSION = 7896bf67ce1d2dc469a44f6d9ec8672dc629b590
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
