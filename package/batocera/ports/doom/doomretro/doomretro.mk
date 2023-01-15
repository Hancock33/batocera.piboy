################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 15, 2023
DOOMRETRO_VERSION = 3cde7392d2409fcaf1f5cfabb95f7cc55704dbb4
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
