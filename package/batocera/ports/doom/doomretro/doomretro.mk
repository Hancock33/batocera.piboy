################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 03, 2025
DOOMRETRO_VERSION = 079c71d36854b52cb50f36f1f4bb4304566a16c8
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
