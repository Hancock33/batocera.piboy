################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 19, 2025
DOOMRETRO_VERSION = be89f21a95b0bb0023e58edfaec01e6cf2cd4af5
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
