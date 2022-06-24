################################################################################
#
# DOOMRETRO
#
################################################################################
# Version: Commits on Jun 24, 2022
DOOMRETRO_VERSION = 3526d9a12314e074b529c87d6cb2e9565e49f027
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
