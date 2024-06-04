################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jun 04, 2024
DOOMRETRO_VERSION = 24b189eb78e508c99183df7d0e5a67b9a93205eb
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
