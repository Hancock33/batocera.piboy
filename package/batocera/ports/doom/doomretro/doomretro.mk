################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 03, 2025
DOOMRETRO_VERSION = 017e580abbca15c9e949bdd90e3c5860f749203a
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
