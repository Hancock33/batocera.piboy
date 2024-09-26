################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 26, 2024
DOOMRETRO_VERSION = 82d1c8328724f2755423f054f16c686564272829
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
