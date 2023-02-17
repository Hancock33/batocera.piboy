################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 17, 2023
DOOMRETRO_VERSION = b15fab68fbcfa373b76b4e3425fdf18d934603d5
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
