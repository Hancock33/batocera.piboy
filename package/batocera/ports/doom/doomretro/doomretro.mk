################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 21, 2024
DOOMRETRO_VERSION = 290503a66fe7b8218728d1c69abbc8122f6511cf
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
