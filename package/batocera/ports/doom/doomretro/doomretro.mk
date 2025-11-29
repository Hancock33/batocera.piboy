################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 29, 2025
DOOMRETRO_VERSION = c690aa2efab5630bd75a40845ab6f83d8fa81b57
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
