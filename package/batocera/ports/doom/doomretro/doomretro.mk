################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 29, 2022
DOOMRETRO_VERSION = 51c56fc5e0fb9dc3096e0a276e897f8ad6454ba9
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
