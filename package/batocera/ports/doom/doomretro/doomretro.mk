################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 12, 2025
DOOMRETRO_VERSION = 8dada3a2bdd486534b75ba60ab161a96c78f6196
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
