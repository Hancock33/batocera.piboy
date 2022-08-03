################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 03, 2022
DOOMRETRO_VERSION = 777d5b44b6a309be3dcf6198ffeb75d9394f5ec2
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
