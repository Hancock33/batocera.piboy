################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 24, 2024
DOOMRETRO_VERSION = 897d2435fd1105d5a1bff4d710c620a44fef1969
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
