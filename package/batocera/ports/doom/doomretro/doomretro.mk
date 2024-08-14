################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 14, 2024
DOOMRETRO_VERSION = 5b6e5b27bc205648d605081b78d21143bc782b66
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
