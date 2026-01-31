################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 31, 2026
DOOMRETRO_VERSION = 605e27f6790af126322df38125f5b4ae3fb09448
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
