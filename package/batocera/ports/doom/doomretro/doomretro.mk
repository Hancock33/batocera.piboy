################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 20, 2024
DOOMRETRO_VERSION = 0a2083cb4408494742fa081134f26c6e4916dc3d
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
