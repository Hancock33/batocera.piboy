################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 10, 2022
DOOMRETRO_VERSION = 8195235c30be4f9808a3986c4da439d777600ee6
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
