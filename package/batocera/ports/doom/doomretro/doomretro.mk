################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jul 10, 2024
DOOMRETRO_VERSION = d4ed6ee538fd19ab5ad1efe19c85027bb0c00b39
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
