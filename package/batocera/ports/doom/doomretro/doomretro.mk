################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 05, 2023
DOOMRETRO_VERSION = f68884870899f333b3696d89d04b52b463bf4ae6
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
