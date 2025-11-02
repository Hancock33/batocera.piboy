################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 02, 2025
DOOMRETRO_VERSION = 22f4c04da59208a7dff78fe2794a146ef7f57f93
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
