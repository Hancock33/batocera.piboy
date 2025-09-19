################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 19, 2025
DOOMRETRO_VERSION = 299e7cf0f7842155dd8c6283c24aa161e21a6f39
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
