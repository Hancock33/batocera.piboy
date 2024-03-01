################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 01, 2024
DOOMRETRO_VERSION = 8b3e71c95aa1ad1bf71808b2b70ee2ca57012449
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
