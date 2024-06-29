################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jun 29, 2024
DOOMRETRO_VERSION = 48e195500f0fa790283425066a4e4e6043cbe7b6
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
