################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jun 29, 2024
DOOMRETRO_VERSION = 7dc122e3178415b6f1c364c3bfcefd1be1a4e238
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
