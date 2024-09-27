################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 27, 2024
DOOMRETRO_VERSION = 24ae608469b1e4d479006fea55e36a7ccdd4c84b
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
