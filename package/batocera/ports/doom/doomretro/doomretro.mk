################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jul 05, 2025
DOOMRETRO_VERSION = e15c8fa629ec96e1e9d1731d44e2e2709b92d6a5
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
