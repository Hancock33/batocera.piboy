################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 14, 2026
DOOMRETRO_VERSION = 13db2be5e5a148dbecd86a6f625f304d080fd7ab
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
