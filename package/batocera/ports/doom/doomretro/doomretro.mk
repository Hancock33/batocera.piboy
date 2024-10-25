################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 25, 2024
DOOMRETRO_VERSION = e9d1c79e07ab87806fede5a5efc698b6c5a2b6f5
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
