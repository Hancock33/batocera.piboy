################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 30, 2023
DOOMRETRO_VERSION = a4122c82ac9f32be1060430809d6240730929d3f
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
