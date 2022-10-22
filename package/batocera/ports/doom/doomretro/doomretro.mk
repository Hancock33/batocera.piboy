################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 22, 2022
DOOMRETRO_VERSION = 94a7e4235ef69c6341a5b41299a2fdd7d210027f
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
