################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 05, 2024
DOOMRETRO_VERSION = 84fe029f56944f86511a8384729d449a05cce336
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
