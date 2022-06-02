################################################################################
#
# DOOMRETRO
#
################################################################################
# Version: Commits on Jun 02, 2022
DOOMRETRO_VERSION = adc9369aa2bd42ca65c180a0661520b6ae44431b
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
