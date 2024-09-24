################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 24, 2024
DOOMRETRO_VERSION = 715727fee938df52064ffddd424cc28c69f19a79
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
