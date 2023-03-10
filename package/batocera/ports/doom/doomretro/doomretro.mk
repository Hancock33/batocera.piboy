################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 10, 2023
DOOMRETRO_VERSION = f2126df899e397abe57740559bc27b12274756fe
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
