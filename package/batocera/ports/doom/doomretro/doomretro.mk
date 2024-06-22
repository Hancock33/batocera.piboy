################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jun 22, 2024
DOOMRETRO_VERSION = 41be468505f8795a733538342c04c3e0148ce633
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
