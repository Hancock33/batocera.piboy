################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 04, 2025
DOOMRETRO_VERSION = 4c0c4455c6f2e1875910a9834d7a46a90c0bd1ad
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
