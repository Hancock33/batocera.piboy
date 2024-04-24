################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 24, 2024
DOOMRETRO_VERSION = 7490169bf80a3c5f82a0d9cb7dbd1261a8f3464e
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
