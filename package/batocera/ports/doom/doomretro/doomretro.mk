################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 26, 2024
DOOMRETRO_VERSION = 0b128e56dcef5fb6522856d3aa94464ba5f136d4
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
