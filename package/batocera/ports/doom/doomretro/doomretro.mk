################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 22, 2023
DOOMRETRO_VERSION = 1610049cbf790c01d0556ff78572bc36efa51991
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
