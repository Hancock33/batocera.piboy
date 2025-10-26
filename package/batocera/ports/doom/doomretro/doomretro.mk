################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 26, 2025
DOOMRETRO_VERSION = 3d74bf7f5aa517e9f217afbf682d3e26243faa76
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
