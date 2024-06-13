################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jun 13, 2024
DOOMRETRO_VERSION = 493e11c6361aebb9d97f8d40a596fe46db568aef
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
