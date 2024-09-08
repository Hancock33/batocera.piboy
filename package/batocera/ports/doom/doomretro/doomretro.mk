################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 08, 2024
DOOMRETRO_VERSION = 775f800e8d15684579e491c84f3c3d0d8e501cc0
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
