################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jun 05, 2024
DOOMRETRO_VERSION = 0f6109a322764eaed4da7277303828f8e07046d0
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
