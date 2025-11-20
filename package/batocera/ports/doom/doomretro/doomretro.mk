################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 20, 2025
DOOMRETRO_VERSION = 1cc3ea696357078b967870929d80492fd7eebffd
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
