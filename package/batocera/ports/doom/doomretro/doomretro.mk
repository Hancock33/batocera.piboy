################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 08, 2025
DOOMRETRO_VERSION = eb23339bcb138f21c242ea5c99344a77df035c86
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
