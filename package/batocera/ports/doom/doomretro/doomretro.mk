################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 21, 2025
DOOMRETRO_VERSION = b469ac9bdb5624fad0b55dd6ac00e1696da03b23
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
