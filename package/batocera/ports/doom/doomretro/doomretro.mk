################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jul 23, 2022
DOOMRETRO_VERSION = 3d364beb42bf3a792ba339f341804d250538286f
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
