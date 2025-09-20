################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 20, 2025
DOOMRETRO_VERSION = 9bd95446bff3af27ac3c8c222c8823ca7c817847
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
