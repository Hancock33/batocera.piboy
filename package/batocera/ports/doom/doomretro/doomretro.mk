################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 30, 2023
DOOMRETRO_VERSION = 9fd301a5be5cc33ec1c9bbb672edd15fa6ee2fb0
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
