################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 10, 2025
DOOMRETRO_VERSION = 6d3ef80c3f5ee9eab643bf614c2db04a7515a543
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
