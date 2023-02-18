################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 18, 2023
DOOMRETRO_VERSION = ca8d994ea8f120f4fc66826264c9b4c6c916fb64
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
