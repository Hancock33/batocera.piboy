################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 27, 2024
DOOMRETRO_VERSION = baff5d3aa8b4e2b335ea83e9367ba332339014bb
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
